require 'spec_helper'

describe "cotizaciones/show.html.haml" do
  before(:each) do
    @cotizacion = assign(:cotizacion, stub_model(Cotizacion,
      :compra => 1.5,
      :moneda_id => 1,
      :venta => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.5.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.5.to_s)
  end
end
