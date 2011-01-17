require 'spec_helper'

describe "agencias/new.html.erb" do
  before(:each) do
    assign(:agencia, stub_model(Agencia,
      :name => "MyString",
      :direccion_id => 1
    ).as_new_record)
  end

  it "renders new agencia form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agencias_path, :method => "post" do
      assert_select "input#agencia_name", :name => "agencia[name]"
      assert_select "input#agencia_direccion_id", :name => "agencia[direccion_id]"
    end
  end
end
