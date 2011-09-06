require 'spec_helper'

describe Deposito do
  it { should validate_presence_of(:tdeposito) }
  it { should validate_presence_of(:numero) }
  it { should validate_presence_of(:entidad) }

  describe '#save' do
    let(:deposito) { Factory.build(:deposito) }
    it 'aumenta el saldo en la cuenta de la entidad' do
      deposito.entidad.should_receive(:deposit).once do
        true
      end
      deposito.errors.should be_empty
      deposito.save!.should == true
    end
  end

  describe "deshacer" do
    let(:deposito) { Factory(:deposito)}
    context 'with enough money' do
      it 'withdraw the money and return true' do
        deposito.entidad.should_receive(:withdraw).with(deposito.monto, deposito.operadora) { true }
        deposito.send(:deshacer).should be_true
      end
    end
  end
end

