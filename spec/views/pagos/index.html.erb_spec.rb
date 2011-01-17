require 'spec_helper'

describe "pagos/index.html.erb" do
  before(:each) do
    assign(:pagos, [
      stub_model(Pago,
        :monto => 1.5,
        :moneda_id => 1
      ),
      stub_model(Pago,
        :monto => 1.5,
        :moneda_id => 1
      )
    ])
  end

  it "renders a list of pagos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
