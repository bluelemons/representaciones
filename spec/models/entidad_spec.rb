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

  describe '#saldo_by(entidad,moneda_id)' do
    it 'devuelve 0 si no hay saldo entre las entidades' do
      agencia = Factory(:agencia)
      operadora = Factory(:operadora)
      agencia.saldo_by(operadora,1).should == 0
    end

    it'devuelve el valor del saldo si es mayor que cero' do
      agencia = Factory(:agencia)
      operadora = Factory(:operadora)
      saldo = Factory(:saldo,:entidad=>agencia,:operadora=>operadora)
      saldo.save.should == true
      agencia.saldo_by(operadora,1).should == 5000
    end

  end

  describe '#deposit_by(entidad,monto)' do
    it 'deposita en el saldo de la agencia con la operadora' do
      agencia = Factory(:agencia)
      operadora = Factory(:operadora)
      monto = Factory(:monto)
      agencia.deposit_by(operadora,monto).should == true
      agencia.saldo_by(operadora,1).should == monto.valor
    end
  end

  describe '#withdraw_by(entindad,monto)' do
    it 'saca del saldo que mantiene la agencia con la operadora' do
      agencia = Factory(:agencia)
      operadora = Factory(:operadora)
      monto = Factory(:monto)
      monto2 = Factory(:monto,:valor=>100)
      agencia.deposit_by(operadora,monto).should == true
      agencia.withdraw_by(operadora,monto2)
      agencia.saldo_by(operadora,1).should == (monto.valor - monto2.valor)
    end
  end


  describe '#saldo (moneda)' do
    it 'returns saldo en la moneda indicada, cero cuando se crea' do
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
      saldo_anterior.should == 0
      saldo_despues = saldo_anterior + monto.valor
      saldo_despues.should == 1000
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
