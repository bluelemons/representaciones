require 'spec_helper'

describe "thabitacions/index.haml" do
  before(:each) do
    assign(:thabitacions, [
      stub_model(Thabitacion,
        :name => "Name"
      ),
      stub_model(Thabitacion,
        :name => "Name"
      )
    ])
  end

  it "renders a list of thabitacions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
