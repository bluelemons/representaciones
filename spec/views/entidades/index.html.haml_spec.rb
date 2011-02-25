require 'spec_helper'

describe "entidades/index.html.haml" do
  before(:each) do
    assign(:entidades, [
      stub_model(Entidad,
        :calle => "Calle",
        :cuit => 1,
        :telefono => "Telefono",
        :legajo => "Legajo",
        :email => "Email",
        :web => "Web",
        :localidad_id => 1,
        :name => "Name",
        :tentidad_id => 1
      ),
      stub_model(Entidad,
        :calle => "Calle",
        :cuit => 1,
        :telefono => "Telefono",
        :legajo => "Legajo",
        :email => "Email",
        :web => "Web",
        :localidad_id => 1,
        :name => "Name",
        :tentidad_id => 1
      )
    ])
  end

  it "renders a list of entidades" do
    render
    rendered.should have_selector("tr>td", :content => "Calle".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Telefono".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Legajo".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Email".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Web".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
