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

  describe '#incrementar(valor)' do
    it 'aumenta el saldo' do
      monto = Factory(:monto, :valor => 5000)
      saldo = Factory(:saldo, :monto => monto)
      saldo.incrementar(500).should be_true
      monto.valor.should == 5500
    end
  end
end
