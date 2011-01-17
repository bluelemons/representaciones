require 'spec_helper'

describe "tdocs/new.html.erb" do
  before(:each) do
    assign(:tdoc, stub_model(Tdoc,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new tdoc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tdocs_path, :method => "post" do
      assert_select "input#tdoc_name", :name => "tdoc[name]"
    end
  end
end
