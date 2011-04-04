require 'spec_helper'

describe Saldo do
  it { should belong_to :entidad }
  it { should belong_to :operadora }
  it { should validate_presence_of :entidad }
  it { should validate_presence_of :monto_cents }
  it { should validate_presence_of :monto_currency }

  describe '#monto' do
    let(:saldo) { Factory(:saldo) }

    it 'Indica el saldo como un objeto Money' do
      saldo.monto.should be_a_kind_of(Money)
    end

    it 'Store the data in the columns monto_cents, monto_currency' do
      cents, currency = rand(500000), ["ARS", "USD", "EUR"][rand(3)]
      saldo.monto = Money.new(cents, currency)
      saldo.save!
      saldo.monto_cents.should == cents
      saldo.monto_currency.should == currency
    end

    it 'Read the data in the columns monto_cents, monto_currency' do
      cents, currency = rand(500000), ["ARS", "USD", "EUR"][rand(3)]
      saldo = Saldo.create(:entidad => Factory(:entidad), :monto_cents => cents,
                           :monto_currency => currency)
#      saldo.monto_cents = cents
#      saldo.monto_currency = currency
#      saldo.save!
      saldo.monto.should == Money.new(cents, currency)
    end

    it 'write the data beatifully' do
      saldo.monto = Money.new(300000, :ARS)
      saldo.monto.format.should == "$3.000,00"
      saldo.monto = Money.new(30000, :USD)
      saldo.monto.format.should == "u$s300,00"
    end
  end
end

