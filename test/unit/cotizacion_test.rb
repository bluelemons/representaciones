require 'test_helper'

class CotizacionTest < ActiveSupport::TestCase

  def test_requiere_campos_obligatorios
    assert Cotizacion.new.invalid?
  end

  def test_buscar_devuelve_la_cotizacion_para_el_par_de_monedas
    fecha = Date.new(2011, 8, 30)
    co = Cotizacion.create!(fecha: fecha, moneda_compra: "ARS",
                            moneda_venta: "USD", compra: 4.5)
    assert_equal co, Cotizacion.buscar(fecha, Money.new(1, :ars), Money.new(1, :usd))
    assert_equal co, Cotizacion.buscar(fecha, Money.new(1, :usd), Money.new(1, :ars))
  end

  def test_add_rate_permite_el_exchange
    Cotizacion.create!(fecha: Date.new(2011, 8, 30),
                       moneda_compra: "ARS", moneda_venta: "USD", compra: 4.5)
    Money.add_rate("ARS", "USD", 0.25)
    assert_equal Money.new(100, "USD"), "4 ARS".to_money.exchange_to("USD")
  end
end