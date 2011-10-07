require 'test_helper'

class ReservaTest < ActiveSupport::TestCase
  setup do
    @reserva = reservas(:grand_celebration)
  end

  test "asociaciones" do
    assert_instance_of Operadora, @reserva.operadora, "Reserva#operadora no funciona correctamente"
    assert_instance_of Agency, @reserva.agency, "Reserva#agency no funciona correctamente"
    assert_instance_of User, @reserva.user, "Reserva#user no funciona correctamente"
    assert @reserva.depositos.count > 0, "El fixture de reserva no tiene depositos"
    @reserva.depositos.each do |deposito|
      assert_instance_of Deposito, deposito, "#{deposito} no es del tipo Deposito"
    end
  end

end
