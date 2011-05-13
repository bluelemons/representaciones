require 'spec_helper'

describe Reserva do
  it { have_many(:pasajeros).through(:viajeros) }

  describe '#pasajeros' do
    let(:reserva) do
      reserva = Factory(:reserva)
      reserva.pasajeros << Factory(:pasajero, :name => 'Roberto, Jimenez')
      reserva
    end
    describe '#names' do
      it 'return an array with names of pasajeros' do
        reserva.pasajeros.names.should be_a_kind_of(Array)
        reserva.pasajeros.names.should include('Roberto, Jimenez')
      end
    end
    describe '#as_symbols' do
      it 'return an array with names of pasajeros as symbols' do
        reserva.pasajeros.as_symbols.should be_a_kind_of(Array)
        reserva.pasajeros.as_symbols.should include(:'roberto, jimenez')
      end
    end
  end
end

