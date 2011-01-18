require 'spec_helper'

describe "tarifas/new.haml" do
  before(:each) do
    assign(:tarifa, stub_model(Tarifa,
      :iva => 1.5,
      :impuesto => 1,
      :monto => 1.5,
      :comision => 1.5,
      :efectivo => 1.5,
      :anticipo => 1.5,
      :comision => 1.5,
      :obs => "MyString",
      :reserva_id => 1
    ).as_new_record)
  end

  it "renders new tarifa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tarifas_path, :method => "post" do
      assert_select "input#tarifa_iva", :name => "tarifa[iva]"
      assert_select "input#tarifa_impuesto", :name => "tarifa[impuesto]"
      assert_select "input#tarifa_monto", :name => "tarifa[monto]"
      assert_select "input#tarifa_comision", :name => "tarifa[comision]"
      assert_select "input#tarifa_efectivo", :name => "tarifa[efectivo]"
      assert_select "input#tarifa_anticipo", :name => "tarifa[anticipo]"
      assert_select "input#tarifa_comision", :name => "tarifa[comision]"
      assert_select "input#tarifa_obs", :name => "tarifa[obs]"
      assert_select "input#tarifa_reserva_id", :name => "tarifa[reserva_id]"
    end
  end
end
