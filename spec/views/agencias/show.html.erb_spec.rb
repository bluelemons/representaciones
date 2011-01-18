require 'spec_helper'

describe "agencias/show.haml" do
  before(:each) do
    @agencia = assign(:agencia, stub_model(Agencia,
      :name => "Name",
      :direccion_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
