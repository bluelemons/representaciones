require 'spec_helper'

describe "movimientos/_pago.haml" do

  #before(:each) do
  #  movimiento = stub_model(Movimiento).as_new_record
  #  movimiento.stub(:monto) { stub_model(Monto).as_new }
  #  assign(:movimiento, movimiento )
  movimiento = Movimiento.new
  movimiento.build_monto

  it "renders new pago form" do
    render :partial =>"movimientos/pago",:locals=>{:@movimiento=>movimiento}
    rendered.should have_selector("form", :action => movimientos_path, :method => "post" ) do |form|
      form.should have_selector("input#movimiento_fecha", :name => "movimiento[fecha]")
      #form.should have_selector("select#movimiento_entidad_id", :name => "movimiento[entidad_id]",:type=>"hidden")
      #form.should have_selector("select#movimiento_reserva_id", :name => "movimiento[reserva_id]",:type=>"hidden")
      form.should have_selector("input#movimiento_monto_attributes_valor", :name => "movimiento[monto_attributes][valor]")
      form.should have_selector("select#movimiento_tdeposito_id", :name => "movimiento[tdeposito_id]")
      form.should have_selector("select#movimiento_monto_attributes_moneda_id", :name => "movimiento[monto_attributes][moneda_id]")
    end
  end
end

