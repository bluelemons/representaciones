require 'spec_helper'

describe Movimiento do
  it { should belong_to(:monto) }
  it { should belong_to(:entidad) }
  it { should belong_to(:tpago) }
  it { should validate_presence_of(:monto) }
  it { should validate_presence_of(:entidad) }
  it { should validate_presence_of(:fecha) }
  it { should validate_presence_of(:tpago) }
  describe '#create' do
    context 'si el movimiento es un deposito' do
      it 'aumenta el saldo de la entidad' do
        deposito = Factory.build(:deposito)
        deposito.save.should == true
        deposito.entidad.saldo(Moneda.find(1)).should == 5000
      end
    end
    context 'si el movimiento es un pago' do
      it 'chequea que haya suficiente plata' do
        entidad = Factory(:entidad)
        pago = Factory.build(:pago, :entidad => entidad)
        pago.save.should == false
        entidad.deposit(Factory(:monto))
        pago.save.should == true
      end
    end
  end
end

