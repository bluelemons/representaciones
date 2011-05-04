require 'spec_helper'

describe Deposito do
  it { should validate_presence_of(:tdeposito) }
  it { should validate_presence_of(:numero) }

  describe '#save' do
    it 'aumenta el saldo de la entidad' do
      pending
      deposito = Factory.build(:deposito)
      deposito.save.should == true
      moneda =Moneda.find(1)
      moneda.id.should >0
      deposito.entidad.saldo(moneda).should == 5000
    end
  end
end

