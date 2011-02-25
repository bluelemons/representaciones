require 'spec_helper'

describe "reservas/show.html.haml" do
  before(:each) do
    @reserva = assign(:reserva, stub_model(Reserva,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("Reservado".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Regimen".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Operado".to_s)
    rendered.should contain(1.5.to_s)
    rendered.should contain(1.5.to_s)
    rendered.should contain(1.5.to_s)
    rendered.should contain(1.to_s)
  end
end
