require 'spec_helper'

describe "pasajeros/new.haml" do
  before(:each) do
    assign(:pasajero, stub_model(Pasajero,
      :doc => 1,
      :name => "MyString",
      :tdoc_id => 1
    ).as_new_record)
  end

  it "renders new pasajero form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pasajeros_path, :method => "post" do
      assert_select "input#pasajero_doc", :name => "pasajero[doc]"
      assert_select "input#pasajero_name", :name => "pasajero[name]"
      assert_select "input#pasajero_tdoc_id", :name => "pasajero[tdoc_id]"
    end
  end
end
