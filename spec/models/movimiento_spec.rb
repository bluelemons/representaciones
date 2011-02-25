require 'spec_helper'

describe Movimiento do
  #asociaciones
  it { should belong_to(:reserva) }
  it { should belong_to(:entidad) }
  it { should belong_to(:monto) }
  it { should belong_to(:tpago) }
  it { should belong_to(:tdeposito) }
end

