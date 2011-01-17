require 'spec_helper'

describe "programas/index.html.erb" do
  before(:each) do
    assign(:programas, [
      stub_model(Programa,
        :name => "Name"
      ),
      stub_model(Programa,
        :name => "Name"
      )
    ])
  end

  it "renders a list of programas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
