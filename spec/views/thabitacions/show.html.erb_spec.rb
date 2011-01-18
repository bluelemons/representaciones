require 'spec_helper'

describe "thabitacions/show.haml" do
  before(:each) do
    @thabitacion = assign(:thabitacion, stub_model(Thabitacion,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
