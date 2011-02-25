# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110225232925) do

  create_table "cotizaciones", :force => true do |t|
    t.date     "fecha"
    t.float    "compra"
    t.integer  "moneda_id"
    t.float    "venta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entidades", :force => true do |t|
    t.string   "calle"
    t.integer  "cuit"
    t.string   "telefono"
    t.string   "legajo"
    t.string   "email"
    t.string   "web"
    t.integer  "localidad_id"
    t.string   "name"
    t.integer  "tentidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "localidades", :force => true do |t|
    t.string   "name"
    t.integer  "postal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monedas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "montos", :force => true do |t|
    t.float    "valor"
    t.integer  "moneda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movimientos", :force => true do |t|
    t.integer  "reserva_id"
    t.integer  "entidad_id"
    t.integer  "tpago_id"
    t.integer  "tdeposito_id"
    t.date     "fecha"
    t.integer  "monto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pasajeros", :force => true do |t|
    t.integer  "doc"
    t.string   "name"
    t.date     "nacimiento"
    t.integer  "tdoc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pasajeros_reservas", :id => false, :force => true do |t|
    t.integer  "reserva_id"
    t.integer  "pasajero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservas", :force => true do |t|
    t.date     "fecha"
    t.date     "salida"
    t.integer  "activa"
    t.string   "reservado"
    t.text     "hoteles"
    t.integer  "periodo"
    t.string   "regimen"
    t.text     "obs"
    t.integer  "thabitacion_id"
    t.integer  "programa_id"
    t.integer  "operadora_id"
    t.integer  "agencia_id"
    t.string   "operado"
    t.float    "iva"
    t.float    "impuesto"
    t.float    "seguro"
    t.integer  "monto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saldos", :force => true do |t|
    t.integer  "entidad_id"
    t.integer  "monto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tdepositos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tdoc", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tentidades", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thabitaciones", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tpagos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
