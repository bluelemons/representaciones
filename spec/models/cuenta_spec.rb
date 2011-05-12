require 'spec_helper'

describe Cuenta do
  it { should belong_to :entidad }
  it { should belong_to :operadora }
  it { should validate_presence_of :entidad }
  it { should validate_presence_of :monto_cents }
  it { should validate_presence_of :monto_currency }

  describe '#monto' do
    let(:cuenta) { Factory(:cuenta) }

    it 'Indica el monto de la cuenta como un objeto Money' do
      cuenta.monto.should be_a_kind_of(Money)
    end

    it 'Store the data in the columns monto_cents, monto_currency' do
      cents, currency = rand(500000), ["ARS", "USD", "EUR"][rand(3)]
      cuenta.monto = Money.new(cents, currency)
      cuenta.save!
      cuenta.monto_cents.should == cents
      cuenta.monto_currency.should == currency
    end

    it 'Read the data in the columns monto_cents, monto_currency' do
      cents, currency = rand(500000), ["ARS", "USD", "EUR"][rand(3)]
      cuenta = Cuenta.create(:entidad => Factory(:entidad), :monto_cents => cents,
                           :monto_currency => currency)
#      cuenta.monto_cents = cents
#      cuenta.monto_currency = currency
#      cuenta.save!
      cuenta.monto.should == Money.new(cents, currency)
    end

    it 'write the data beatifully' do
      cuenta.monto = Money.new(300000, :ARS)
      cuenta.monto.format.should == "$3.000,00"
      cuenta.monto = Money.new(30000, :USD)
      cuenta.monto.format.should == "u$s300,00"
    end
  end
end

