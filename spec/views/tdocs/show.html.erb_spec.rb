require 'spec_helper'

describe "tdocs/show.haml" do
  before(:each) do
    @tdoc = assign(:tdoc, stub_model(Tdoc,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
