require 'spec_helper'

describe "depositos/_form.haml" do

  before(:each) do
    deposito = stub_model(Deposito).as_new_record
    assign(:deposito, deposito )
  end

  it "renders new deposito form" do
    render "depositos/form"
    rendered.should have_selector("form", :action => depositos_path, :method => "post" ) do |form|
      form.should have_selector("input#deposito_fecha", :name => "deposito[fecha]")
      form.should have_selector("select#deposito_entidad_id", :name => "deposito[entidad_id]")
      form.should have_selector("input#deposito_monto_attributes_valor", :name => "deposito[monto_attributes][valor]")
      form.should have_selector("select#deposito_tdeposito_id", :name => "deposito[tdeposito_id]")
      form.should have_selector("select#deposito_monto_attributes_moneda_id", :name => "deposito[monto_attributes][moneda_id]")
    end
  end
end

