describe Entidad do
  describe '#create' do
    it 'create a saldo for each moneda' do
      new = Factory(:entidad).create
      Saldos.where(:entidad => new).should have(3).items
    end
  end
  describe '#saldo (moneda)' do
    it 'returns saldo en la moneda indicada' do
      entidad = Factory(:entidad_con_saldo)
      moneda = Moneda.where(id => 1)
      entidad.saldo(moneda).should == 500
    end
  end
  describe '#deposit (monto)' do
    it 'agrega el monto al saldo correspondiente de la entidad' do
      entidad = Factory(:entidad_con_saldo)
      monto = Factory(:monto, :valor => 100)
      entidad.deposit(monto).should == 600
      Saldos.where(:entidad => entidad, :moneda => monto.moneda).monto.valor.should == 600
    end
  end
end
  
