require 'test_helper'

class ReservasControllerTest < ActionDispatch::IntegrationTest
  fixtures :all

  def test_index_muestra_tabla_de_reservas
    get reservas_path
    assert_response :success
    assert_select "table"
  end

  def test_show_muestra_los_datos_de_la_reserva
    get reserva_path(reservas(:costa_magica))
    assert_response :success
    assert_match /COSTA MAGICA/, response.body
  end

  def test_index_pagina
    20.times do
      Reserva.create!(salida: Date.today,
                      thabitacion: thabitacions(:cuadruple),
                      programa: programas(:punta_del_este),
                      operadora: entidads(:costa),
                      agency: entidads(:litoraltur),
                      total: Money.new(100, "USD"))
    end

    get reservas_path
    assert_response :success
    assert_select "nav.pagy"

    get reservas_path, params: { page: 2 }
    assert_response :success
    assert_select "nav.pagy"
  end
end