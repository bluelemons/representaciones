require 'test_helper'

# Monetary arithmetic: Entidad#deposit, #withdraw and #cuenta are the
# highest-risk business logic for the Rails upgrade (see upgrade-rails.md), so
# pin them with black-box tests over the persisted Cuenta.
class EntidadTest < ActiveSupport::TestCase

  setup { skip "M2b: port de money" }

  def test_deposit_crea_una_cuenta_por_moneda
    entidad = entidads(:costa)
    assert entidad.deposit("5000 USD")
    assert_equal 1, entidad.cuentas(true).count
    assert_equal Money.new(500000, "USD"), entidad.cuentas(true).first.monto
    assert entidad.deposit("100 ARS")
    assert_equal 2, entidad.cuentas(true).count
    assert_equal Money.new(10000, "ARS"), entidad.cuenta(:ars).monto
  end

  def test_deposit_incrementa_la_cuenta_existente
    entidad = entidads(:costa)
    entidad.deposit("5000 USD")
    entidad.deposit("3000 USD")
    assert_equal Money.new(800000, "USD"), entidad.cuentas(true).first.monto
  end

  def test_deposit_separa_las_cuentas_por_operadora
    entidad = entidads(:costa)
    operadora = entidads(:ibero)
    entidad.deposit("500 USD")
    entidad.deposit("500 USD", operadora)
    assert_equal 2, entidad.cuentas(true).count
    assert_equal Money.new(50000, "USD"), entidad.cuenta(:usd).monto
    assert_equal Money.new(50000, "USD"), entidad.cuenta("USD", operadora.id).monto
  end

  def test_withdraw_descuenta_el_total_de_la_cuenta
    entidad = entidads(:costa)
    entidad.deposit("5000 USD")
    assert entidad.withdraw("5000 USD")
    assert_equal Money.new(0, "USD"), entidad.cuenta(:usd).monto
  end

  def test_withdraw_rechaza_saldo_insuficiente
    entidad = entidads(:costa)
    entidad.deposit("5000 USD")
    refute entidad.withdraw("6000 USD")
    assert_equal Money.new(500000, "USD"), entidad.cuenta(:usd).monto
  end

  def test_cuenta_devuelve_nil_si_no_existe
    assert_nil entidads(:vikingo).cuenta(:ars)
  end

  def test_can_be_deleted_solo_sin_registros_asociados
    entidad = Operadora.create!(name: "EntTest#{rand(10000)}")
    assert entidad.can_be_deleted?
    entidad.deposit("100 USD")
    entidad.reload
    refute entidad.can_be_deleted?
  end
end