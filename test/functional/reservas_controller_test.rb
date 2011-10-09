require 'test_helper'

class ReservasControllerTest < ActionController::TestCase
  setup do
    @reserva = reservas(:grand_celebration)
    sign_in users(:susana)
  end

  test "should have a link to show_reserva" do
    get :index
    assert_select "td a", "Show"
  end

  test "should have a link to new_pago" do
    get :index
    assert_select "td a", "Crear Pago"
  end
end
