require 'spec_helper'

describe "programas/edit.html.erb" do
  before(:each) do
    @programa = assign(:programa, stub_model(Programa,
      :name => "MyString"
    ))
  end

  it "renders the edit programa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => programa_path(@programa), :method => "post" do
      assert_select "input#programa_name", :name => "programa[name]"
    end
  end
end
