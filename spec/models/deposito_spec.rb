require 'spec_helper'

describe Deposito do
  it { should should validate_presence_of(:tdeposito) }
  it { should should validate_presence_of(:numero) }
  
  describe '#save' do
    it 'aumenta el saldo de la entidad' do
      deposito = Factory.build(:deposito)
      deposito.save.should == true
      deposito.entidad.saldo(Moneda.find(1)).should == 5000
    end
  end
end

