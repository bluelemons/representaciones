require 'spec_helper'

describe "operadoras/new.haml" do
  before(:each) do
    assign(:operadora, stub_model(Operadora,
      :name => "MyString",
      :direccion_id => 1
    ).as_new_record)
  end

  it "renders new operadora form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => operadoras_path, :method => "post" do
      assert_select "input#operadora_name", :name => "operadora[name]"
      assert_select "input#operadora_direccion_id", :name => "operadora[direccion_id]"
    end
  end
end
