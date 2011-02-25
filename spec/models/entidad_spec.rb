require 'spec_helper'

describe Entidad do
  # asociaciones
  it { should belong_to(:localidad) }
  it { should belong_to(:tentidad) }
  it { should have_many(:saldos) }
  it { should have_many(:movimientos) }
  pending "add some examples to (or delete) #{__FILE__}"
end

