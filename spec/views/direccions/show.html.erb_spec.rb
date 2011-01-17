require 'spec_helper'

describe "direccions/show.html.erb" do
  before(:each) do
    @direccion = assign(:direccion, stub_model(Direccion,
      :direccion => "Direccion",
      :cuit => 1,
      :telefono => "Telefono",
      :legajo => "Legajo",
      :email => "Email",
      :web => "Web",
      :localidad_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Direccion/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Telefono/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Legajo/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Web/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
