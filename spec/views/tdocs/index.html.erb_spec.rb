require 'spec_helper'

describe "tdocs/index.haml" do
  before(:each) do
    assign(:tdocs, [
      stub_model(Tdoc,
        :name => "Name"
      ),
      stub_model(Tdoc,
        :name => "Name"
      )
    ])
  end

  it "renders a list of tdocs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
