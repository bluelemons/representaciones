require 'spec_helper'

describe "pagos/index.html.erb" do
  before(:each) do
    assign(:pagos, [
      stub_model(Pago,
        :entidad_id => 1,
        :reserva_id => 1,
        :monto_cents => 1,
        :monto_currency => "Monto Currency",
        :monto_original_cents => 1,
        :monto_original_currency => "Monto Original Currency",
        :operadora_id => 1,
        :tdeposito_id => 1,
        :numero => "Numero",
        :observaciones => "MyText",
        :hidden => false
      ),
      stub_model(Pago,
        :entidad_id => 1,
        :reserva_id => 1,
        :monto_cents => 1,
        :monto_currency => "Monto Currency",
        :monto_original_cents => 1,
        :monto_original_currency => "Monto Original Currency",
        :operadora_id => 1,
        :tdeposito_id => 1,
        :numero => "Numero",
        :observaciones => "MyText",
        :hidden => false
      )
    ])
  end

  it "renders a list of pagos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Monto Currency".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Monto Original Currency".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
