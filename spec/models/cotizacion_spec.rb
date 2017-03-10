require 'rails_helper'

describe Cotizacion do
  let! :cotizacion do
    FactoryGirl(:cotizacion, :moneda_venta => 'ARS', :moneda_compra => 'USD',
        :compra => ("1.0".to_d / "4.5".to_d).to_f)
  end
  it 'I can search them' do
    described_class.find_by_fecha_and_moneda_venta_and_moneda_compra(
        cotizacion.fecha, 'ARS', 'USD').should == cotizacion
  end
  it '#add_rate should add the rates' do
    cotizacion.add_rate.should be_true
    "4,50 ARS".to_money.exchange_to("USD").should == "1 USD".to_money
  end
end

