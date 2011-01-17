require 'spec_helper'

describe "operadoras/edit.html.erb" do
  before(:each) do
    @operadora = assign(:operadora, stub_model(Operadora,
      :name => "MyString",
      :direccion_id => 1
    ))
  end

  it "renders the edit operadora form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => operadora_path(@operadora), :method => "post" do
      assert_select "input#operadora_name", :name => "operadora[name]"
      assert_select "input#operadora_direccion_id", :name => "operadora[direccion_id]"
    end
  end
end
