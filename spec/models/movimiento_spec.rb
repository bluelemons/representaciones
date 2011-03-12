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
    context 'si el movimiento es un pago de una agencia' do
      it 'el saldo de la operadora aumenta' do
        entidad = Factory(:agencia)
        reserva = Factory(:reserva)
        pago = Factory.build(:pago, :entidad => entidad,:reserva=>reserva)
        moneda = Moneda.find(1)
        saldo_anterior = pago.reserva.operadora.saldo(moneda)
        entidad.deposit(Factory(:monto))
        pago.save
        pago.reserva.operadora.saldo(moneda).should == (saldo_anterior + pago.monto.valor)
      end
    end
#    context 'si el movimiento es un pago' do
#      it 'la moneda del pago debe conicidir con la moneda de la reserva' do
#        true.should == false
#      end
#    end
#
#    context 'si el movimiento es un deposito directo abierto' do
#      it 'debe depositar en la operadora y hacer un pago de la agencia' do
#
#      end
#    end
#
#    context 'si el movimiento es un deposito directo cerrado' do
#      it 'debe depositar en la operadora y hacer un pago de la agencia y operadora' do
#
#      end
#    end

  end
end

