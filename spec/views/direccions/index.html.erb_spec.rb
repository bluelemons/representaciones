require 'spec_helper'

describe "direccions/index.html.erb" do
  before(:each) do
    assign(:direccions, [
      stub_model(Direccion,
        :direccion => "Direccion",
        :cuit => 1,
        :telefono => "Telefono",
        :legajo => "Legajo",
        :email => "Email",
        :web => "Web",
        :localidad_id => 1
      ),
      stub_model(Direccion,
        :direccion => "Direccion",
        :cuit => 1,
        :telefono => "Telefono",
        :legajo => "Legajo",
        :email => "Email",
        :web => "Web",
        :localidad_id => 1
      )
    ])
  end

  it "renders a list of direccions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Direccion".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Legajo".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Web".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
