require 'test_helper'

class CuentaTest < ActiveSupport::TestCase

  setup { skip "M2b: port de money" }

  def test_monto_almacena_y_lexica_en_cents_y_moneda
    cents, currency = 35220, "ARS"
    cuenta = Cuenta.create!(entidad: entidads(:costa),
                            monto_cents: cents, monto_currency: currency)
    assert_equal Money.new(cents, currency), cuenta.monto
  end

  def test_monto_format
    cuenta = Cuenta.new(entidad: entidads(:costa))
    cuenta.monto = Money.new(300000, :ars)
    assert_equal "$ 3.000,00", cuenta.monto.format
    cuenta.monto = Money.new(30000, :usd)
    assert_equal "u$s 300,00", cuenta.monto.format
  end

  def test_invalida_sin_campos_requeridos
    refute Cuenta.new.valid?
  end
end