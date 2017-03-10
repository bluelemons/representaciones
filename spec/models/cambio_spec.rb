require 'rails_helper'

describe Cambio do
  it { should validate_presence_of :cuenta }

  it "works" do
    fecha = Forgery(:date).date :max_delta=>150, :past => true
    FactoryGirl(:cotizacion, :fecha => fecha, :moneda_venta => "ARS", :moneda_compra => "USD", :compra => 4.07)
    entidad = FactoryGirl(:agency)
    FactoryGirl(:deposito, :entidad => entidad, :monto => "500 ARS")
    cuenta = entidad.cuentas.first
    Cambio.create({"fecha"=>fecha, "entidad_id"=>entidad.id, "cuenta_id"=>cuenta.id, "monto" => "100,00 USD"}).should be_true
  end
  describe 'deshacer' do
    let(:cambio) { FactoryGirl(:working_cambio) }
    context 'with enough money' do
      it 'withdraw the money and return true' do
        op = cambio.operadora
        cambio.entidad.should_receive(:withdraw).with(cambio.monto, op) { true }
        cambio.entidad.should_receive(:deposit) { true }
        cambio.send(:deshacer).should be_true
      end
    end
  end
end

