require 'spec_helper'

describe "reservas/index.html.erb" do
  before(:each) do
    assign(:reservas, [
      stub_model(Reserva,
        :activa => 1,
        :reservado => "Reservado",
        :hotel => "Hotel",
        :periodo => 1,
        :regimen => "Regimen",
        :obs => "MyText",
        :thabitacion_id => 1,
        :programa_id => 1,
        :operadora_id => 1,
        :agencia_id => 1
      ),
      stub_model(Reserva,
        :activa => 1,
        :reservado => "Reservado",
        :hotel => "Hotel",
        :periodo => 1,
        :regimen => "Regimen",
        :obs => "MyText",
        :thabitacion_id => 1,
        :programa_id => 1,
        :operadora_id => 1,
        :agencia_id => 1
      )
    ])
  end

  it "renders a list of reservas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Reservado".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hotel".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Regimen".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
