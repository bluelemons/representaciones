require 'spec_helper'

describe Entidad do
  it { should have_many(:cuentas) }
  it { should have_many(:movimientos) }
  # should be checked in other way
  it "{ should validate_uniqueness_of(:name) }"
  it { should validate_presence_of(:name) }

  describe '#deposit (money, operadora_id)' do
    let(:entidad) { Factory(:entidad) }
    it 'Crea la cuenta si no existe' do
      entidad.cuentas.count.should == 0
      entidad.deposit(Money.new(10000, :ars))
      entidad.cuentas(true).count.should == 1
    end
    it 'si la cuenta existe lo incrementa' do
      entidad.cuentas.count.should == 0
      entidad.deposit(Money.new(10000)).should be_true
      entidad.deposit(Money.new(10000)).should be_true
      entidad.cuentas.count.should == 1
      entidad.cuentas(true).first.monto.should == Money.new(20000)
    end
  end

  describe '#withdraw(money, cuenta)' do

    let (:entidad) { Factory(:entidad) }

    context 'if there is enough money' do
      it 'return true' do
        entidad.deposit("5000 ARS")
        entidad.reload.withdraw("3000 ARS").should be_true
      end
    end

    context 'if there is not enough money' do
      it 'raise exception' do
        lambda { entidad.withdraw("5000 ARS") }.should raise_error
      end
    end
  end
end

