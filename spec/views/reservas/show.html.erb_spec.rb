require 'spec_helper'

describe "reservas/show.html.erb" do
  before(:each) do
    @reserva = assign(:reserva, stub_model(Reserva,
      :activa => 1,
      :reservado => "Reservado",
      :hotel => "Hotel",
      :periodo => 1,
      :regimen => "Regimen",
      :obs => "MyText",
      :thabitacion_id => 1,
      :programa_id => 1,
      :operadora_id => 1,
      :agencia_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Reservado/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Hotel/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Regimen/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
