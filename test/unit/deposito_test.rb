require 'test_helper'

class DepositoTest < ActiveSupport::TestCase

  def setup
    @deposito = movimientos(:deposito_ibero)
  end

  def test_format_monto
    deposito_sin_cambio_de_moneda = movimientos(:deposito_ibero)
    assert_equal "u$s 2.000,00", deposito_sin_cambio_de_moneda.format_monto
    deposito_con_cambio_de_moneda = movimientos(:deposito_vikingo)
    assert_equal "$ 8.320,00 -> u$s 2.000,00", deposito_con_cambio_de_moneda.format_monto
  end

  def test_validations
    d = Deposito.new
    assert d.invalid?, "Deposito valido sin datos"
    assert @deposito.valid?, "Deposito en fixture invalido"
    @deposito.monto_final = "500 ARS"
    assert @deposito.invalid?, "Deposito valido en una moneda distinta que la de la reserva"
  end

  def test_validacion_de_reserva
    @deposito.entidad = entidads(:litoraltur)
    assert @deposito.invalid?, "Deposito valido, por una entidad que no corresponde a la reserva"
  end

end

