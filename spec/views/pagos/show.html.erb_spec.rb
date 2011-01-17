require 'spec_helper'

describe "pagos/show.html.erb" do
  before(:each) do
    @pago = assign(:pago, stub_model(Pago,
      :monto => 1.5,
      :moneda_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
