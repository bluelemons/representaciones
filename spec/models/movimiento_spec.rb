require 'spec_helper'

describe Movimiento do
  it { should belong_to(:monto) }
  it { should belong_to(:entidad) }
  it { should validate_presence_of(:monto) }
  it { should validate_presence_of(:entidad) }
  it { should validate_presence_of(:fecha) }

  describe '#create' do
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

