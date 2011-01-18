require 'spec_helper'

describe "thabitacions/edit.haml" do
  before(:each) do
    @thabitacion = assign(:thabitacion, stub_model(Thabitacion,
      :name => "MyString"
    ))
  end

  it "renders the edit thabitacion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => thabitacion_path(@thabitacion), :method => "post" do
      assert_select "input#thabitacion_name", :name => "thabitacion[name]"
    end
  end
end
