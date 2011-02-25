require 'spec_helper'

describe "cotizaciones/new.html.haml" do
  before(:each) do
    assign(:cotizacion, stub_model(Cotizacion,
      :compra => 1.5,
      :moneda_id => 1,
      :venta => 1.5
    ).as_new_record)
  end

  it "renders new cotizacion form" do
    render

    rendered.should have_selector("form", :action => cotizaciones_path, :method => "post") do |form|
      form.should have_selector("input#cotizacion_compra", :name => "cotizacion[compra]")
      form.should have_selector("select#cotizacion_moneda_id", :name => "cotizacion[moneda_id]")
      form.should have_selector("input#cotizacion_venta", :name => "cotizacion[venta]")
    end
  end
end

