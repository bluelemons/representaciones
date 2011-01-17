require 'spec_helper'

describe "pagos/new.html.erb" do
  before(:each) do
    assign(:pago, stub_model(Pago,
      :monto => 1.5,
      :moneda_id => 1
    ).as_new_record)
  end

  it "renders new pago form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pagos_path, :method => "post" do
      assert_select "input#pago_monto", :name => "pago[monto]"
      assert_select "input#pago_moneda_id", :name => "pago[moneda_id]"
    end
  end
end
