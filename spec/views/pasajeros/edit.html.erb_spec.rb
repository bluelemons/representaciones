require 'spec_helper'

describe "pasajeros/edit.html.erb" do
  before(:each) do
    @pasajero = assign(:pasajero, stub_model(Pasajero,
      :doc => 1,
      :name => "MyString",
      :tdoc_id => 1
    ))
  end

  it "renders the edit pasajero form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pasajero_path(@pasajero), :method => "post" do
      assert_select "input#pasajero_doc", :name => "pasajero[doc]"
      assert_select "input#pasajero_name", :name => "pasajero[name]"
      assert_select "input#pasajero_tdoc_id", :name => "pasajero[tdoc_id]"
    end
  end
end
