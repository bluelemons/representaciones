require 'test_helper'

class CrearReservaTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "crear una reserva nueva" do
    sign_in users(:susana)
    get "/"
    assert_select "h1", "Reservas"
    assert_select "#reserva_new"
    get "/reservas/new.js"
    post "/reservas.js",
      reserva: { referencia: "1047793",
                 salida: 3.days.ago.strftime("%d-%m-%Y"),
                 agency_id: entidads(:litoraltur).id,
                 reservado: "paula",
                 operadora_id: entidads(:ibero).id,
                 operado: "",
                 programa_id: programas(:cuba).id,
                 thabitacion_id: thabitacions(:cuadruple).id,
                 habitaciones: "1",
                 regimen: "des",
                 periodo: "7 noches",
                 hotel: "w fort lauderdale",
                 total_fields: { total: "9669,00", total_currency: "USD" },
                 tarifa: "11208",
                 pasajero_ids: ["", pasajeros(:julieta).id] }
    assert_equal 302, response.status
    assert_equal "Reserva creada", flash[:notice]
  end

  def sign_in user
    post '/users/sign_in',
      user: { username: user.username, password: 'password' }
  end
end
