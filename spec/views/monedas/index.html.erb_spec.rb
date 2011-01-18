require 'spec_helper'

describe "monedas/index.haml" do
  before(:each) do
    assign(:monedas, [
      stub_model(Moneda,
        :name => "Name"
      ),
      stub_model(Moneda,
        :name => "Name"
      )
    ])
  end

  it "renders a list of monedas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
