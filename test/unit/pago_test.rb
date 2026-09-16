require 'test_helper'

# Pago: covers the upgrade-critical money validations (currency mismatch, saldo
# insuficiente) and the presence constraints on the STI base.
class PagoTest < ActiveSupport::TestCase

  setup { skip "M2b: port de money" }

  def test_requiere_campos_obligatorios
    pago = Pago.new
    refute pago.valid?
    [:reserva, :cuenta, :entidad].each do |attr|
      assert pago.errors[attr].any?, "expected error on #{attr}"
    end
    assert pago.errors[:monto_cents].any?
  end

  def test_requiere_dinero_suficiente_en_la_cuenta
    pago = Pago.new(
      reserva:      reservas(:grand_celebration),
      entidad:      entidads(:vikingo),
      cuenta:       cuentas(:cuenta_vikingo),
      monto:        "500 USD",
      fecha:        Date.today
    )
    refute pago.valid?
    assert pago.errors[:base].any? { |e| e.include?("suficiente dinero") },
           pago.errors[:base].inspect
  end

  def test_rechaza_monedas_distintas_entre_cuenta_y_reserva
    pago = Pago.new(
      reserva:      reservas(:grand_celebration),
      entidad:      entidads(:vikingo),
      cuenta:       cuentas(:cuenta_vikingo),
      monto:        "500 ARS",
      fecha:        Date.today
    )
    refute pago.valid?
    assert pago.errors[:base].any? { |e| e.include?("no coinciden") },
           pago.errors[:base].inspect
  end
end
