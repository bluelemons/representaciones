require 'spec_helper'

describe "reservas/new.html.haml" do
  before(:each) do
    assign(:reserva, stub_model(Reserva,
      :activa => 1,
      :reservado => "MyString",
      :hoteles => "MyText",
      :periodo => 1,
      :regimen => "MyString",
      :obs => "MyText",
      :thabitacion_id => 1,
      :programa_id => 1,
      :operadora_id => 1,
      :agencia_id => 1,
      :operado => "MyString",
      :iva => 1.5,
      :impuesto => 1.5,
      :seguro => 1.5,
      :monto_id => 1
    ).as_new_record)
  end

  it "renders new reserva form" do
    render

    rendered.should have_selector("form", :action => reservas_path, :method => "post") do |form|
      form.should have_selector("input#reserva_activa", :name => "reserva[activa]")
      form.should have_selector("input#reserva_reservado", :name => "reserva[reservado]")
      form.should have_selector("textarea#reserva_hoteles", :name => "reserva[hoteles]")
      form.should have_selector("input#reserva_periodo", :name => "reserva[periodo]")
      form.should have_selector("input#reserva_regimen", :name => "reserva[regimen]")
      form.should have_selector("textarea#reserva_obs", :name => "reserva[obs]")
      form.should have_selector("select#reserva_thabitacion_id", :name => "reserva[thabitacion_id]")
      form.should have_selector("select#reserva_programa_id", :name => "reserva[programa_id]")
      form.should have_selector("select#reserva_operadora_id", :name => "reserva[operadora_id]")
      form.should have_selector("select#reserva_agencia_id", :name => "reserva[agencia_id]")
      form.should have_selector("input#reserva_operado", :name => "reserva[operado]")
      form.should have_selector("input#reserva_iva", :name => "reserva[iva]")
      form.should have_selector("input#reserva_impuesto", :name => "reserva[impuesto]")
      form.should have_selector("input#reserva_seguro", :name => "reserva[seguro]")
      form.should have_selector("select#reserva_monto_id", :name => "reserva[monto_id]")
    end
  end
end

