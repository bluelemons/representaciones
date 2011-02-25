require 'spec_helper'

describe "entidades/edit.html.haml" do
  before(:each) do
    @entidad = assign(:entidad, stub_model(Entidad,
      :calle => "MyString",
      :cuit => 1,
      :telefono => "MyString",
      :legajo => "MyString",
      :email => "MyString",
      :web => "MyString",
      :localidad_id => 1,
      :name => "MyString",
      :tentidad_id => 1
    ))
  end

  it "renders the edit entidad form" do
    render

    rendered.should have_selector("form", :action => entidad_path(@entidad), :method => "post") do |form|
      form.should have_selector("input#entidad_calle", :name => "entidad[calle]")
      form.should have_selector("input#entidad_cuit", :name => "entidad[cuit]")
      form.should have_selector("input#entidad_telefono", :name => "entidad[telefono]")
      form.should have_selector("input#entidad_legajo", :name => "entidad[legajo]")
      form.should have_selector("input#entidad_email", :name => "entidad[email]")
      form.should have_selector("input#entidad_web", :name => "entidad[web]")
      form.should have_selector("input#entidad_localidad_id", :name => "entidad[localidad_id]")
      form.should have_selector("input#entidad_name", :name => "entidad[name]")
      form.should have_selector("input#entidad_tentidad_id", :name => "entidad[tentidad_id]")
    end
  end
end
