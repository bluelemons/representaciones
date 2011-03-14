require 'spec_helper'

describe Saldo do
  it { should belong_to(:entidad) }
  it { should belong_to(:moneda) }
  it { should belong_to(:monto) }
  it { should belong_to(:operadora) }
  it { should validate_presence_of(:entidad) }
  it { should validate_presence_of(:monto) }

  describe 'cuando se liste saldo' do
    it 'debe hacer un join de monto' do
      saldo = Factory(:saldo)
      saldo = Saldo.by_moneda_id(1)
      saldo.first.valor.should >= 0
    end
  end

end

