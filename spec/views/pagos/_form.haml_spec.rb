require 'spec_helper'

describe "pagos/_form.haml" do

  before(:each) do
    pago = stub_model(Pago).as_new_record
    search = Reserva.search
    assign(:pago, pago)
    assign(:search, search)
  end

  it "renders new pago form" do
# TODO Habría que poner qsearch (el formulario de busqueda) en un partial
# dejo el código comentado.
#    stub_template "reservas/_qsearch.haml" => "<div class='qs_search'>busqueda</div>"
    stub_template "reservas/_reservas.haml" => "<div class='reservas'>listado de Reservas</div>"
    render "pagos/form"
    rendered.should have_selector("form[data-remote]", :action => pagos_path, :method => "post") do |form|
      form.should have_selector("input#pago_fecha.datepicker", :name => "pago[fecha]")
      form.should have_selector("input#pago_entidad_id", :name => "pago[entidad_id]", :type=>"hidden")
      form.should have_selector("input#pago_reserva_id", :name => "pago[reserva_id]")
      form.should have_selector("input#pago_monto_fields_monto", :name => "pago[monto_fields][monto]")
      form.should have_selector("select#pago_monto_fields_monto_currency", :name => "pago[monto_fields][monto_currency]")
    end
    rendered.should have_selector("div.reservas", :count=>1)
#    rendered.should have_selector("div.qs_search", :count=>1)
  end
end

