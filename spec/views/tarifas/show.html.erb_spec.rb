require 'spec_helper'

describe "tarifas/show.html.erb" do
  before(:each) do
    @tarifa = assign(:tarifa, stub_model(Tarifa,
      :iva => 1.5,
      :impuesto => 1,
      :monto => 1.5,
      :comision => 1.5,
      :efectivo => 1.5,
      :anticipo => 1.5,
      :comision => 1.5,
      :obs => "Obs",
      :reserva_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Obs/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
