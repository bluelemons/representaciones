require 'test_helper'

class MovimientoTest < ActiveSupport::TestCase

  test "total agrupa los montos por moneda" do
    total = Movimiento.total([movimientos(:deposito_ibero),
                              movimientos(:deposito_vikingo)])
    assert_equal Money.new(200000, "USD"), total["USD"]
    assert_equal Money.new(832000, "ARS"), total["ARS"]
  end

  test "total suma los montos de la misma moneda" do
    total = Movimiento.total([movimientos(:deposito_ibero),
                              movimientos(:sobrepago_ibero)])
    assert_equal Money.new(400000, "USD"), total["USD"]
  end
end