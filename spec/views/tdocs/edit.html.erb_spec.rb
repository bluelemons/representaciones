require 'spec_helper'

describe "tdocs/edit.haml" do
  before(:each) do
    @tdoc = assign(:tdoc, stub_model(Tdoc,
      :name => "MyString"
    ))
  end

  it "renders the edit tdoc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tdoc_path(@tdoc), :method => "post" do
      assert_select "input#tdoc_name", :name => "tdoc[name]"
    end
  end
end
