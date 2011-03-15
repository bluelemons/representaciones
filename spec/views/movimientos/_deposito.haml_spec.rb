require 'spec_helper'

describe "movimientos/_deposito.haml" do

  before(:each) do
    movimiento = stub_model(Movimiento).as_new_record
    movimiento.stub(:monto) { stub_model(Monto).as_new_record }
    assign(:movimiento, movimiento )
  end
# Finished in 0.43267 seconds

#  before(:each) do
#   movimiento = Movimiento.new
#   movimiento.build_monto
#   assign(:movimiento, movimiento )
#  end
# Finished in 0.54722 seconds


  it "renders new deposito form" do
    render "movimientos/deposito"
    rendered.should have_selector("form", :action => movimientos_path, :method => "post" ) do |form|
      form.should have_selector("input#movimiento_fecha", :name => "movimiento[fecha]")
      form.should have_selector("select#movimiento_entidad_id", :name => "movimiento[entidad_id]")
      form.should have_selector("input#movimiento_monto_attributes_valor", :name => "movimiento[monto_attributes][valor]")
      form.should have_selector("select#movimiento_tdeposito_id", :name => "movimiento[tdeposito_id]")
      form.should have_selector("select#movimiento_monto_attributes_moneda_id", :name => "movimiento[monto_attributes][moneda_id]")
    end
  end
end

