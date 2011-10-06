require 'test_helper'

class ReservaTest < ActiveSupport::TestCase
  setup do
    @reserva = reservas(:costa_magica)
  end

  test "asociaciones" do
    assert_instance_of Operadora, @reserva.operadora
    assert_instance_of Agency, @reserva.agency
    assert_instance_of User, @reserva.user
  end

end
