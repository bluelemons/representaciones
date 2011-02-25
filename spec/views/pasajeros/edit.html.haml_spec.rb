require 'spec_helper'

describe "pasajeros/edit.html.haml" do
  before(:each) do
    @pasajero = assign(:pasajero, stub_model(Pasajero,
      :doc => 1,
      :name => "MyString",
      :tdoc_id => 1
    ))
  end

  it "renders the edit pasajero form" do
    render

    rendered.should have_selector("form", :action => pasajero_path(@pasajero), :method => "post") do |form|
      form.should have_selector("input#pasajero_doc", :name => "pasajero[doc]")
      form.should have_selector("input#pasajero_name", :name => "pasajero[name]")
      form.should have_selector("select#pasajero_tdoc_id", :name => "pasajero[tdoc_id]")
    end
  end
end

