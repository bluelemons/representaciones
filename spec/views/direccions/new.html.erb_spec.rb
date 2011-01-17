require 'spec_helper'

describe "direccions/new.html.erb" do
  before(:each) do
    assign(:direccion, stub_model(Direccion,
      :direccion => "MyString",
      :cuit => 1,
      :telefono => "MyString",
      :legajo => "MyString",
      :email => "MyString",
      :web => "MyString",
      :localidad_id => 1
    ).as_new_record)
  end

  it "renders new direccion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => direccions_path, :method => "post" do
      assert_select "input#direccion_direccion", :name => "direccion[direccion]"
      assert_select "input#direccion_cuit", :name => "direccion[cuit]"
      assert_select "input#direccion_telefono", :name => "direccion[telefono]"
      assert_select "input#direccion_legajo", :name => "direccion[legajo]"
      assert_select "input#direccion_email", :name => "direccion[email]"
      assert_select "input#direccion_web", :name => "direccion[web]"
      assert_select "input#direccion_localidad_id", :name => "direccion[localidad_id]"
    end
  end
end
