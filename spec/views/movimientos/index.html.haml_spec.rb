require 'spec_helper'

describe "movimientos/index.html.haml" do
  before(:each) do
    assign(:movimientos, [
      stub_model(Movimiento,
        :reserva_id => 1,
        :entidad_id => 1,
        :tpago_id => 1,
        :tdeposito_id => 1,
        :monto_id => 1
      ),
      stub_model(Movimiento,
        :reserva_id => 1,
        :entidad_id => 1,
        :tpago_id => 1,
        :tdeposito_id => 1,
        :monto_id => 1
      )
    ])
  end

  it "renders a list of movimientos" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
  end
end

