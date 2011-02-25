require 'spec_helper'

describe "pasajeros/show.html.haml" do
  before(:each) do
    @pasajero = assign(:pasajero, stub_model(Pasajero,
      :doc => 1,
      :name => "Name",
      :tdoc_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("Name".to_s)
    rendered.should contain(1.to_s)
  end
end
