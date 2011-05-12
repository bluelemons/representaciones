require 'spec_helper'

describe Pago do

  #it { should validate_presence_of(:reserva) }

  describe '#save' do
    it 'valida: suficiente plata en la cuenta' do
      pending
    end
    it 'valida: coinciden las monedas de cuenta y reserva' do
      pending
    end
    it 'quita dinero de la cuenta' do
      pending
      cuenta = mock_model(Cuenta)
      cuenta.should_receive(:withdraw).with(500)
      pago = Factory.build(:pago, :cuenta => cuenta)
      pago.save.should be_true
    end
  end
end

