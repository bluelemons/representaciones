require 'test_helper'

class CrearReservaTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "visit" do
    sign_in users(:susana)
    visit '/reservas'
    click_on 'Alta'
    fill_in 'Referencia', with: "1047793"
    fill_in 'Salida', with: 3.days.ago.strftime("%d-%m-%Y")
    select entidads(:litoraltur).name, from: 'Agencia'
    fill_in 'Reservado', with: "paula"
    select entidads(:ibero).name, from: 'Operadora'
    select programas(:cuba).name, from: 'Programa'
    select thabitacions(:cuadruple).name, from: 'Tipo de habitacion'
    fill_in 'Regimen', with: "des"
    fill_in 'Periodo', with: "7 noches"
    fill_in 'Hotel', with: "w fort lauderdale"
    fill_in 'reserva[total_fields][total]', with: '9669,00'
    select 'u$s', from: 'reserva[total_fields][total_currency]'
    fill_in 'Tarifa', with: "11208"
    fill_in 'Nombre', with: 'Tito Puente'
    fill_in 'Numero', with: '12345678'
    click_on 'Crear Pasajero'
    click_on 'Crear Reserva'
    assert_text 'Reserva creada'
  end
end
