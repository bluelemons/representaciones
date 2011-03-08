require 'spec_helper'

describe "agencias/index.haml" do
  before(:each) do
    assign(:agencias, [
      stub_model(Agencia,
        :name => "Name",
        :direccion_id => 1
      ),
      stub_model(Agencia,
        :name => "Name",
        :direccion_id => 1
      )
    ])
  end

  it "renders a list of agencias" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end