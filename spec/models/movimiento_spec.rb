require 'spec_helper'

describe Movimiento do
  it { should belong_to(:entidad) }
  it { should validate_presence_of(:entidad) }
  it { should validate_presence_of(:fecha) }
  it { should validate_presence_of(:monto_cents) }
  it { should validate_presence_of(:monto_currency) }
end

