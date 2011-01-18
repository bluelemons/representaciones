require 'spec_helper'

describe "pagos/edit.haml" do
  before(:each) do
    @pago = assign(:pago, stub_model(Pago,
      :monto => 1.5,
      :moneda_id => 1
    ))
  end

  it "renders the edit pago form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pago_path(@pago), :method => "post" do
      assert_select "input#pago_monto", :name => "pago[monto]"
      assert_select "input#pago_moneda_id", :name => "pago[moneda_id]"
    end
  end
end
