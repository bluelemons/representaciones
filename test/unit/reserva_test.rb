require 'test_helper'

class ReservaTest < ActiveSupport::TestCase

  def setup
    @reserva = reservas(:grand_celebration)
  end

  def test_modificacion_del_monto_total
    reserva_sin_pagos = reservas(:costa_magica)
    reserva_sin_pagos.total = "500 ARS"
    assert reserva_sin_pagos.valid?, "No me permite cambiar el monto de una reserva sin pagos"
    reserva_con_pagos = @reserva
    reserva_con_pagos.total = "500 ARS"
    assert reserva_con_pagos.invalid?, "Me permite cambiar la moneda de una reserva con pagos"
  end

  test "Representacion como string" do
    assert_equal "Reserva ref:1346266 pax:MOLINARI ##{ @reserva.id }", @reserva.to_s
  end
end

