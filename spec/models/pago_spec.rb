require 'spec_helper'

describe Pago do
  describe '#create' do
    it 'valida: suficiente plata en el saldo' do
      pending
    end
    it 'valida: coinciden monedas de saldo y reserva' do
      pending
    end
    it 'quita dinero del saldo' do
      saldo = mock_model(Saldo)
      saldo.should_receive(:withdraw).with(500)
      pago = Factory.build(:pago, :saldo => saldo)
      pago.save
    end
  end
end

