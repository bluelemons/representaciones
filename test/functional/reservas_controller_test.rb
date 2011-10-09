require 'test_helper'

class ReservasControllerTest < ActionController::TestCase
  setup do
    @reserva = reservas(:grand_celebration)
    sign_in users(:susana)
  end

  test "should have a link to mostrar_reserva" do
    get :index
    assert_select "td a", "Mostrar"
  end

  test "should have a link to new_pago" do
    get :index
    assert_select "td a", "Pagar"
  end
end
