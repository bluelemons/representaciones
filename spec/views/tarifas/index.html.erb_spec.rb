require 'spec_helper'

describe "tarifas/index.haml" do
  before(:each) do
    assign(:tarifas, [
      stub_model(Tarifa,
        :iva => 1.5,
        :impuesto => 1,
        :monto => 1.5,
        :comision => 1.5,
        :efectivo => 1.5,
        :anticipo => 1.5,
        :comision => 1.5,
        :obs => "Obs",
        :reserva_id => 1
      ),
      stub_model(Tarifa,
        :iva => 1.5,
        :impuesto => 1,
        :monto => 1.5,
        :comision => 1.5,
        :efectivo => 1.5,
        :anticipo => 1.5,
        :comision => 1.5,
        :obs => "Obs",
        :reserva_id => 1
      )
    ])
  end

  it "renders a list of tarifas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Obs".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
