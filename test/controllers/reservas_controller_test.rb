require 'test_helper'

class ReservasControllerTest < ActionDispatch::IntegrationTest
  fixtures :all

  def test_index_muestra_tabla_de_reservas
    get reservas_path
    assert_response :success
    assert_select "table"
  end

  def test_show_muestra_los_datos_de_la_reserva
    get reserva_path(reservas(:costa_magica))
    assert_response :success
    assert_match /COSTA MAGICA/, response.body
  end
end