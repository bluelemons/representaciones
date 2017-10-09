require 'test_helper'

class CrearPaseTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "pase entre reservas con la misma moneda" do
    sign_in users(:susana)
    visit '/reservas'
    within 'tr', text: '1346266' do
      click_on 'Show'
    end
    click_on 'Crear pase'
    assert_text 'Saldo restante: 30.48 USD'
    select reservas(:ultra_park).to_s, from: 'Agregar reserva destino'
    assert_text 'Saldo restante: 0.00 USD'
    click_on 'Crear Transfer'
    assert_text 'El pase fue creado'
    accept_alert do
      click_on 'Cancelar pase'
    end
    assert_text 'El pase fue eliminado'
  end
end
