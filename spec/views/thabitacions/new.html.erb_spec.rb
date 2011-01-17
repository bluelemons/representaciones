require 'spec_helper'

describe "thabitacions/new.html.erb" do
  before(:each) do
    assign(:thabitacion, stub_model(Thabitacion,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new thabitacion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => thabitacions_path, :method => "post" do
      assert_select "input#thabitacion_name", :name => "thabitacion[name]"
    end
  end
end
