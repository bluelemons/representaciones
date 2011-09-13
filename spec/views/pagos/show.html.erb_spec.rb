require 'spec_helper'

describe "pagos/show.html.erb" do
  before(:each) do
    @pago = assign(:pago, stub_model(Pago,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Monto Currency/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Monto Original Currency/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Numero/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
