require 'spec_helper'

describe Reserva do
  it {should belong_to(:thabitacion) }
  it { should belong_to(:programa) }
  it { should belong_to(:monto) }
  it { should belong_to(:operadora) }
  it { should belong_to(:agencia) }
  it { should have_many(:movimientos) }
  it { should have_and_belong_to_many(:pasajeros) }
end

