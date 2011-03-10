require 'spec_helper'

describe Entidad do
  it { should belong_to(:localidad) }
  it { should belong_to(:tentidad) }
  it { should have_many(:saldos) }
  it { should have_many(:movimientos) }

  describe '#create' do
    it 'create a saldo for each moneda' do
      entidad = Factory.build(:entidad)
      entidad.save.should == true
      Saldo.where(:entidad_id => entidad.id).all.should have(3).items
    end
  end

  describe '#saldo (moneda)' do
    it 'returns saldo en la moneda indicada' do
      entidad = Factory(:entidad)
      moneda = Moneda.find(1)
      entidad.saldo(moneda).should == 0
    end
  end

  describe '#deposit (monto)' do
    it 'agrega el monto al saldo correspondiente de la entidad' do
      entidad = Factory(:entidad)
      monto = Factory(:monto, :valor => 1000)
      saldo_anterior = entidad.saldo(monto.moneda)
      saldo_despues = saldo_anterior + monto.valor
      entidad.deposit(monto).should == saldo_despues
      entidad.saldo(monto.moneda).should == saldo_despues
    end
  end

  describe '#withdraw' do
    context 'if there is enough money' do
      it 'should return cuanto queda en la cuenta' do
        entidad = Factory(:entidad)
        monto = Factory(:monto, :valor => 5000)
        entidad.deposit(monto)
        # monto = Factory(:monto, :valor => 5000)
        # saldo = Factory(:saldo, :entidad => entidad, :monto => monto)
        entidad.withdraw(Factory(:monto, :valor => 100)).should == 4900
        entidad.saldo(monto.moneda).should == 4900
        #saldo.monto(true).valor.should == 4900
      end
    end
    context 'if there is not enough money' do
      it 'give error' do
        entidad = Factory(:entidad)
        entidad.withdraw(Factory(:monto, :valor => 100000)).should == false
      end
    end
  end
end

