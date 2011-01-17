require 'spec_helper'

describe "monedas/edit.html.erb" do
  before(:each) do
    @moneda = assign(:moneda, stub_model(Moneda,
      :name => "MyString"
    ))
  end

  it "renders the edit moneda form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => moneda_path(@moneda), :method => "post" do
      assert_select "input#moneda_name", :name => "moneda[name]"
    end
  end
end
