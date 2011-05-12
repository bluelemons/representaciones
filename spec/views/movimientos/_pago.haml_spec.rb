require 'spec_helper'

describe "movimientos/_pago.haml" do

  before(:each) do
    movimiento = stub_model(Movimiento).as_new_record
    movimiento.stub(:monto) { stub_model(Monto).as_new_record }
    assign(:movimiento, movimiento)
  end

  it "renders new pago form" do
    stub_template "reservas/qsearch.haml" => "<div class='qs_search'></div>"
    render "movimientos/pago"
    rendered.should have_selector("form[data-remote]", :action => movimientos_path, :method => "post") do |form|
      form.should have_selector("input#movimiento_fecha.datepicker", :name => "movimiento[fecha]")
      form.should have_selector("input#movimiento_entidad_id", :name => "movimiento[entidad_id]", :type=>"hidden")
      form.should have_selector("input#movimiento_reserva_id", :name => "movimiento[reserva_id]")
      form.should have_selector("input#movimiento_monto_attributes_valor", :name => "movimiento[monto_attributes][valor]")
      form.should have_selector("select#movimiento_tdeposito_id", :name => "movimiento[tdeposito_id]")
      form.should have_selector("select#movimiento_monto_attributes_moneda_id", :name => "movimiento[monto_attributes][moneda_id]")
    end
    rendered.should have_selector("div.qs_search", :count=>1)
    rendered.should have_selector("div#cuentas", :count=>1)
  end
end

