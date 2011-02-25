require 'spec_helper'

describe "movimientos/new.html.haml" do
  before(:each) do
    assign(:movimiento, stub_model(Movimiento,
      :reserva_id => 1,
      :entidad_id => 1,
      :tpago_id => 1,
      :tdeposito_id => 1,
      :monto_id => 1
    ).as_new_record)
  end

  it "renders new movimiento form" do
    render

    rendered.should have_selector("form", :action => movimientos_path, :method => "post") do |form|
      form.should have_selector("select#movimiento_reserva_id", :name => "movimiento[reserva_id]")
      form.should have_selector("select#movimiento_entidad_id", :name => "movimiento[entidad_id]")
      form.should have_selector("select#movimiento_tpago_id", :name => "movimiento[tpago_id]")
      form.should have_selector("select#movimiento_tdeposito_id", :name => "movimiento[tdeposito_id]")
      form.should have_selector("select#movimiento_monto_id", :name => "movimiento[monto_id]")
    end
  end
end

