require 'spec_helper'

describe "reservas/edit.html.erb" do
  before(:each) do
    @reserva = assign(:reserva, stub_model(Reserva,
      :activa => 1,
      :reservado => "MyString",
      :hotel => "MyString",
      :periodo => 1,
      :regimen => "MyString",
      :obs => "MyText",
      :thabitacion_id => 1,
      :programa_id => 1,
      :operadora_id => 1,
      :agencia_id => 1
    ))
  end

  it "renders the edit reserva form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reserva_path(@reserva), :method => "post" do
      assert_select "input#reserva_activa", :name => "reserva[activa]"
      assert_select "input#reserva_reservado", :name => "reserva[reservado]"
      assert_select "input#reserva_hotel", :name => "reserva[hotel]"
      assert_select "input#reserva_periodo", :name => "reserva[periodo]"
      assert_select "input#reserva_regimen", :name => "reserva[regimen]"
      assert_select "textarea#reserva_obs", :name => "reserva[obs]"
      assert_select "input#reserva_thabitacion_id", :name => "reserva[thabitacion_id]"
      assert_select "input#reserva_programa_id", :name => "reserva[programa_id]"
      assert_select "input#reserva_operadora_id", :name => "reserva[operadora_id]"
      assert_select "input#reserva_agencia_id", :name => "reserva[agencia_id]"
    end
  end
end
