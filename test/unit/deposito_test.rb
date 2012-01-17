require 'test_helper'

class DepositoTest < ActiveSupport::TestCase

  def test_format_monto
    deposito_sin_cambio_de_moneda = movimientos(:deposito_ibero)
    assert_equal "u$s 2.000,00", deposito_sin_cambio_de_moneda.format_monto
    deposito_con_cambio_de_moneda = movimientos(:deposito_vikingo)
    assert_equal "$ 8.320,00 -> u$s 2.000,00", deposito_con_cambio_de_moneda.format_monto
  end

  def test_validations
    d = Deposito.new
    assert d.invalid?, "Deposito valido sin datos"
    d = movimientos(:deposito_vikingo)
    assert d.valid?, "Deposito en fixture invalido"
    d.monto_final = "500 ARS"
    assert d.invalid?, "Deposito valido en una moneda distinta que la de la reserva"
  end

end

