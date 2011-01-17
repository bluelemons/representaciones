require 'spec_helper'

describe "monedas/show.html.erb" do
  before(:each) do
    @moneda = assign(:moneda, stub_model(Moneda,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
