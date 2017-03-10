require 'rails_helper'

describe Reserva do
  it { should have_many(:pasajeros).through(:viajeros) }

  describe '#pasajeros' do
    let(:reserva) do
      reserva = FactoryGirl.build(:reserva)
      reserva.pasajeros << FactoryGirl.build(:pasajero, :name => 'Roberto, Jimenez')
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
  describe 'total' do
    let(:reserva) { FactoryGirl.build(:reserva) }
    it "return a Money object" do
      reserva.total.should be_a_kind_of(Money)
    end
  end
end

