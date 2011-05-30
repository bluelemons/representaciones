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
end

