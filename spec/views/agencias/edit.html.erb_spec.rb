require 'spec_helper'

describe "agencias/edit.haml" do
  before(:each) do
    @agencia = assign(:agencia, stub_model(Agencia,
      :name => "MyString",
      :direccion_id => 1
    ))
  end

  it "renders the edit agencia form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agencia_path(@agencia), :method => "post" do
      assert_select "input#agencia_name", :name => "agencia[name]"
      assert_select "input#agencia_direccion_id", :name => "agencia[direccion_id]"
    end
  end
end
