require 'spec_helper'

describe "entidades/show.html.haml" do
  before(:each) do
    @entidad = assign(:entidad, stub_model(Entidad,
      :calle => "Calle",
      :cuit => 1,
      :telefono => "Telefono",
      :legajo => "Legajo",
      :email => "Email",
      :web => "Web",
      :localidad_id => 1,
      :name => "Name",
      :tentidad_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Calle".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Telefono".to_s)
    rendered.should contain("Legajo".to_s)
    rendered.should contain("Email".to_s)
    rendered.should contain("Web".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Name".to_s)
    rendered.should contain(1.to_s)
  end
end
