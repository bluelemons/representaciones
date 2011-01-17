require 'spec_helper'

describe "pasajeros/show.html.erb" do
  before(:each) do
    @pasajero = assign(:pasajero, stub_model(Pasajero,
      :doc => 1,
      :name => "Name",
      :tdoc_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
