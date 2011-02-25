require 'spec_helper'

describe Monto do
  # asociaciones
  it { should belong_to(:moneda) }
end

