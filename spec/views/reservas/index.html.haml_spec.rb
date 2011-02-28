require 'spec_helper'

describe "reservas/index.html.haml" do
  before(:each) do
    assign(:reservas, [
      stub_model(Reserva,
        :activa => 1,
        :reservado => "Reservado",
        :hoteles => "MyText",
        :periodo => 1,
        :regimen => "Regimen",
        :obs => "MyText",
        :thabitacion_id => 1,
        :programa_id => 1,
        :operadora_id => 1,
        :agencia_id => 1,
        :operado => "Operado",
        :iva => 1.5,
        :impuesto => 1.5,
        :seguro => 1.5,
        :monto_id => 1
      ),
      stub_model(Reserva,
        :activa => 1,
        :reservado => "Reservado",
        :hoteles => "MyText",
        :periodo => 1,
        :regimen => "Regimen",
        :obs => "MyText",
        :thabitacion_id => 1,
        :programa_id => 1,
        :operadora_id => 1,
        :agencia_id => 1,
        :operado => "Operado",
        :iva => 1.5,
        :impuesto => 1.5,
        :seguro => 1.5,
        :monto_id => 1
      )
    ])
  end

  it "renders a list of reservas" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => "Reservado".to_s)
    rendered.should have_selector("tr>td", :content => "MyText".to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => "Regimen".to_s)
    rendered.should have_selector("tr>td", :content => "MyText".to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => "Operado".to_s)
    rendered.should have_selector("tr>td", :content => 1.5.to_s)
    rendered.should have_selector("tr>td", :content => 1.5.to_s)
    rendered.should have_selector("tr>td", :content => 1.5.to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
  end
end

