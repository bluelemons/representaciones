require 'spec_helper'

shared_examples_for "Entidad" do
  context 'validaciones' do
    it { should have_many(:cuentas) }
    it { should have_many(:movimientos) }
    it { should validate_presence_of(:name) }
  end
  describe '#deposit (money, operadora_id)' do
    it 'Crea la cuenta si no existe' do
      entidad.cuentas.count.should == 0
      entidad.deposit(Money.new(10000, :ars))
      entidad.cuentas(true).count.should == 1
    end
    it 'si la cuenta existe lo incrementa' do
      entidad.cuentas.count.should == 0
      entidad.deposit(Money.new(10000)).should be_true
      entidad.deposit(Money.new(10000)).should be_true
      entidad.cuentas.count.should == 1
      entidad.cuentas(true).first.monto.should == Money.new(20000)
    end
  end

  describe '#withdraw(money, cuenta)' do
    context 'if there is enough money' do
      it 'return true' do
        entidad.deposit("5000 ARS")
        entidad.reload.withdraw("3000 ARS").should be_true
      end
    end
    context 'if there is not enough money' do
      it 'returns false' do
        entidad.withdraw("5000 ARS").should be_false
      end
    end
  end

  describe '#deudas' do
    before(:each) do
      entidad.reservas.stub(:deudas) do
        %w( 2ARS 5ARS 3USD 2ARS ).map { |m| m.to_money }
      end
    end
    describe '#_deudas_by_currency' do
      it 'sum deudas by currency' do
        resultados = entidad.send(:_deudas_by_currency)
        resultados[:ars.to_currency].should == "9 ARS".to_money
        resultados[:usd.to_currency].should == "3 USD".to_money
      end
    end
  end
  describe 'reservas.deudas' do
    it 'return an array' do
      entidad.reservas.deudas.should be_a_kind_of(Array)
    end
  end
end

