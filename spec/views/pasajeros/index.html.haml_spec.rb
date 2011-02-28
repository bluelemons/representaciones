require 'spec_helper'

describe "pasajeros/index.html.haml" do
  before(:each) do
    assign(:pasajeros, [
      stub_model(Pasajero,
        :doc => 1,
        :name => "Name",
        :tdoc_id => 1
      ),
      stub_model(Pasajero,
        :doc => 1,
        :name => "Name",
        :tdoc_id => 1
      )
    ])
  end

  it "renders a list of pasajeros" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => "Name".to_s)
    rendered.should have_selector("tr>td", :content => 1.to_s)
  end
end

