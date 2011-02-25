require 'spec_helper'

describe "movimientos/show.html.haml" do
  before(:each) do
    @movimiento = assign(:movimiento, stub_model(Movimiento,
      :reserva_id => 1,
      :entidad_id => 1,
      :tpago_id => 1,
      :tdeposito_id => 1,
      :monto_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
  end
end
