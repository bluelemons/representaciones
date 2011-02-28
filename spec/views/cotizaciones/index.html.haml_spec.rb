require 'spec_helper'

describe "cotizaciones/index.html.haml" do
  before(:each) do
    assign(:cotizaciones, [
      stub_model(Cotizacion,
        :compra => 1.5,
        :moneda_id => 1,
        :venta => 1.5
      ),
      stub_model(Cotizacion,
        :compra => 1.5,
        :moneda_id => 1,
        :venta => 1.5
      )
    ])
  end

  it "renders a list of cotizaciones" do
    render
    rendered.should have_selector("tr>td", :content => "1")
    rendered.should have_selector("tr>td", :content => "1.5")
    rendered.should have_selector("tr>td", :content => "1")
  end
end

