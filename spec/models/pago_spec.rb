# encoding: UTF-8
require 'rails_helper'

describe Pago do

  it { should validate_presence_of(:reserva) }
  it { should validate_presence_of(:cuenta) }
  it { should validate_presence_of(:entidad) }

  describe 'before_validation' do
    context 'if not given a Cuenta' do
      let(:pago) { FactoryGirl.build(:pago, :cuenta => nil) }
      it 'ask Entidad to assign one' do
        pago.entidad.should_receive(:cuenta) do
          FactoryGirl.build(:cuenta, :monto => Money.parse("5000000"))
        end
        pago.valid? #.should be_true
        pago.cuenta.should_not be_nil
      end
    end
  end
  describe '#save' do
    let(:pago) { FactoryGirl.build(:pago) }
    it 'salva el pago con valores correctos' do
      pago.save.should be_truthy
      pago.errors.should be_empty
    end
    context 'debt is less than monto' do
      it 'change monto to the value of debt' do
        method = (pago.entidad.type.downcase + "_deuda").to_sym
        pago.reserva.stub(method) { "50".to_money(pago.monto.currency) }
        pago.save
        pago.monto.should <= "50".to_money(pago.monto.currency)
      end
    end

    context 'si no coinciden las monedas de cuenta y reserva' do
      it 'da un error si la cuenta está en una moneda distinta' do
        pago.cuenta.stub(:monto) { Money.parse("10000 AED") }
        pago.valid?.should be_falsey
        pago.errors[:base].should include("Las monedas de la reserva y la cuenta no coinciden")
      end
      it 'da un error si la reserva está en una moneda distinta' do
        pago.reserva.stub(:total) { Money.parse("10000 AED") }
        pago.valid?.should be_falsey
        pago.errors[:base].should include("Las monedas de la reserva y la cuenta no coinciden")
      end
    end

    context 'si no tiene suficiente plata en la cuenta' do
      it 'da un error explicativo' do
        pago.cuenta = FactoryGirl.build :cuenta, monto: Money.new(1, pago.monto.currency)
        pago.valid?.should be_falsey
        pago.errors[:base].should include("Debe tener suficiente dinero para efectuar el pago")
      end
    end
  end

  describe "deshacer" do
    let(:pago) { FactoryGirl.build(:pago)}
    it 'deposit the money to the entidad and return true' do
      pago.entidad.should_receive(:deposit).with(pago.monto, pago.operadora) { true }
      pago.send(:deshacer).should be_truthy
    end
  end
end

