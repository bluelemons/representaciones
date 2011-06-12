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
    it 'returns an array' do
      entidad.deudas.should be_a_kind_of(Array)
    end
    it 'pregunta a cada reserva su deuda' do
      entidad.should_receive(:reservas).once do
        Array.new(rand(5)) do
          r = double()
          r.should_receive(:"#{entidad.type.downcase}_deuda").once do
            Money.empty()
          end
          r
        end
      end
      entidad.deudas
    end
    it 'sum deudas by currency' do
      entidad.stub(:reservas) do
        deudas = ["2 ARS", "5 ARS", "3 USD", "2 ARS"]
        Array.new(4) do |index|
          r = double()
          r.stub(:"#{entidad.type.downcase}_deuda") do
            deudas[index].to_money
          end
          r
        end
      end
      resultados = entidad.deudas
      resultados.should include("9 ARS".to_money, "3 USD".to_money)
    end
  end
  describe 'reservas.deudas' do
    it 'return an array' do
      entidad.reservas.deudas.should be_a_kind_of(Array)
    end
  end
end

