require 'test_helper'

class ReportsTest < ActiveSupport::TestCase

  def test_entidad_report_genera_un_pdf
    assert_pdf EntidadReport.new.to_pdf(Entidad.baja.to_a)
  end

  def test_movimiento_report_genera_un_pdf
    totales = {
      "ARS" => Money.new(0, "ARS").format,
      "USD" => Money.new(0, "USD").format,
      "EUR" => Money.new(0, "EUR").format
    }
    assert_pdf MovimientoReport.new.to_pdf(Movimiento.baja.to_a, totales)
  end

  def test_reserva_report_genera_un_pdf
    assert_pdf ReservaReport.new.regular(Reserva.baja.to_a, {})
  end

  def test_reserva_report_situacion_operadora_genera_un_pdf
    assert_pdf ReservaReport.new.situacion_operadora(Reserva.baja, {})
  end

  def test_voucher_report_genera_un_pdf
    assert_pdf VoucherReport.new.to_pdf(Reserva.baja.to_a, "filtros")
  end

  private

  def assert_pdf(output)
    assert_kind_of String, output
    assert output.bytesize > 100
    assert_match(/\A%PDF/, output)
  end
end