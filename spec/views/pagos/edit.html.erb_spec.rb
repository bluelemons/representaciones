require 'spec_helper'

describe "pagos/edit.html.erb" do
  before(:each) do
    @pago = assign(:pago, stub_model(Pago,
      :entidad_id => 1,
      :reserva_id => 1,
      :monto_cents => 1,
      :monto_currency => "MyString",
      :monto_original_cents => 1,
      :monto_original_currency => "MyString",
      :operadora_id => 1,
      :tdeposito_id => 1,
      :numero => "MyString",
      :observaciones => "MyText",
      :hidden => false
    ))
  end

  it "renders the edit pago form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pagos_path(@pago), :method => "post" do
      assert_select "input#pago_entidad_id", :name => "pago[entidad_id]"
      assert_select "input#pago_reserva_id", :name => "pago[reserva_id]"
      assert_select "input#pago_monto_cents", :name => "pago[monto_cents]"
      assert_select "input#pago_monto_currency", :name => "pago[monto_currency]"
      assert_select "input#pago_monto_original_cents", :name => "pago[monto_original_cents]"
      assert_select "input#pago_monto_original_currency", :name => "pago[monto_original_currency]"
      assert_select "input#pago_operadora_id", :name => "pago[operadora_id]"
      assert_select "input#pago_tdeposito_id", :name => "pago[tdeposito_id]"
      assert_select "input#pago_numero", :name => "pago[numero]"
      assert_select "textarea#pago_observaciones", :name => "pago[observaciones]"
      assert_select "input#pago_hidden", :name => "pago[hidden]"
    end
  end
end
