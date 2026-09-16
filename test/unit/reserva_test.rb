require 'test_helper'

class ReservaTest < ActiveSupport::TestCase

  def setup
    @reserva = reservas(:grand_celebration)
  end

  def test_modificacion_del_monto_total
    skip "M2b: port de money"
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

  test "Referencias unicas por operadora" do
    reserva = reservas(:costa_magica).dup
    refute reserva.valid?
    assert reserva.errors[:referencia] == ["ya está cargada"]
    reserva.operadora = entidads(:ibero)
    assert reserva.valid?
  end

  # --- existence-based unit tests for upgrade-critical behaviour ----

  test "requires_salida_thabitacion_programa_operadora_and_agency" do
    reserva = Reserva.new
    refute reserva.valid?
    [:salida, :thabitacion_id, :programa_id, :operadora_id, :agency_id].each do |attr|
      assert reserva.errors[attr].any?, "expected error on #{attr}"
    end
  end

  test "titular returns the name of the first pasajero" do
    assert_equal "MOLINARI MARIA JULIETA", @reserva.titular
  end

  test "moneda returns the currency symbol of total" do
    skip "M2b: port de money"
    assert_equal "u$s ", @reserva.moneda
  end

  test "sin_tarifa_true_when_total_is_zero" do
    skip "M2b: port de money"
    refute @reserva.sin_tarifa?
    @reserva.total = "0 USD"
    assert @reserva.sin_tarifa?
  end

  test "liquidada_requires_both_liquido_flags_and_positive_total" do
    skip "M2b: port de money"
    assert @reserva.total.cents > 0
    refute @reserva.liquidada?
    @reserva.liquido_agencia  = true
    @reserva.liquido_operadora = true
    assert @reserva.liquidada?
  end

  test "deuda_delegates_to_agency_or_operadora" do
    skip "M2b: port de money"
    assert_equal Money.new(-3048, "USD"), @reserva.deuda(entidads(:vikingo))
    assert_equal Money.new(-3048, "USD"), @reserva.deuda(entidads(:ibero))
  end

  test "deuda_raises_when_entidad_does_not_belong_to_reserva" do
    skip "M2b: port de money"
    assert_raises(RuntimeError) { @reserva.deuda(entidads(:costa)) }
  end

  test "destroy_es_borrado_logico" do
    reserva = reservas(:costa_magica)
    refute reserva.hidden
    assert reserva.destroy
    assert reserva.reload.hidden
  end

  test "pasajeros_names_and_symbols" do
    names  = @reserva.pasajeros.names
    symbols = @reserva.pasajeros.as_symbols
    assert names.is_a?(Array)
    assert names.include?("MOLINARI MARIA JULIETA")
    assert symbols.include?(:"molinari maria julieta")
  end
end

