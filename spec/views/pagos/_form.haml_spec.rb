require 'spec_helper'

describe "pagos/_form.haml" do

  before(:each) do
    pago = stub_model(Pago).as_new_record
    assign(:pago, pago)
  end

  it "renders new pago form" do
    stub_template "reservas/qsearch.haml" => "<div class='qs_search'></div>"
    render "pagos/form"
    rendered.should have_selector("form[data-remote]", :action => pagos_path, :method => "post") do |form|
      form.should have_selector("input#pago_fecha.datepicker", :name => "pago[fecha]")
      form.should have_selector("input#pago_entidad_id", :name => "pago[entidad_id]", :type=>"hidden")
      form.should have_selector("input#pago_reserva_id", :name => "pago[reserva_id]")
      form.should have_selector("input#pago_monto_attributes_valor", :name => "pago[monto_attributes][valor]")
      form.should have_selector("select#pago_tdeposito_id", :name => "pago[tdeposito_id]")
      form.should have_selector("select#pago_monto_attributes_moneda_id", :name => "pago[monto_attributes][moneda_id]")
    end
    rendered.should have_selector("div.qs_search", :count=>1)
    rendered.should have_selector("div#cuentas", :count=>1)
  end
end

