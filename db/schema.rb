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

ActiveRecord::Schema.define(:version => 20110506124940) do

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.boolean  "open"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cotizacions", :force => true do |t|
    t.date     "fecha"
    t.integer  "moneda_id"
    t.float    "compra"
    t.float    "venta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departamentos", :force => true do |t|
    t.string   "name"
    t.integer  "provincia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entidad_versions", :force => true do |t|
    t.integer  "entidad_id"
    t.integer  "version"
    t.string   "calle"
    t.string   "cuit"
    t.string   "telefono"
    t.string   "legajo"
    t.string   "email"
    t.string   "web"
    t.integer  "localidad_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",         :default => false
    t.integer  "user_id"
    t.string   "versioned_type"
  end

  add_index "entidad_versions", ["entidad_id"], :name => "index_entidad_versions_on_entidad_id"

  create_table "entidads", :force => true do |t|
    t.string   "calle"
    t.string   "cuit"
    t.string   "telefono"
    t.string   "legajo"
    t.string   "email"
    t.string   "web"
    t.integer  "localidad_id"
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",       :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "localidads", :force => true do |t|
    t.string   "name"
    t.integer  "departamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moneda_versions", :force => true do |t|
    t.integer  "moneda_id"
    t.integer  "version"
    t.string   "name"
    t.string   "simbolo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
  end

  add_index "moneda_versions", ["moneda_id"], :name => "index_moneda_versions_on_moneda_id"

  create_table "monedas", :force => true do |t|
    t.string   "name"
    t.string   "simbolo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "montos", :force => true do |t|
    t.float    "valor"
    t.integer  "moneda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movimiento_versions", :force => true do |t|
    t.integer  "movimiento_id"
    t.integer  "version"
    t.integer  "entidad_id"
    t.integer  "reserva_id"
    t.integer  "tdeposito_id"
    t.integer  "saldo_id"
    t.integer  "monto_id"
    t.integer  "numero"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",         :default => false
    t.integer  "user_id"
    t.string   "versioned_type"
    t.integer  "operadora_id"
  end

  add_index "movimiento_versions", ["movimiento_id"], :name => "index_movimiento_versions_on_movimiento_id"

  create_table "movimientos", :force => true do |t|
    t.integer  "entidad_id"
    t.integer  "reserva_id"
    t.string   "type"
    t.integer  "tdeposito_id"
    t.integer  "saldo_id"
    t.integer  "monto_id"
    t.integer  "numero"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",                      :default => false
    t.integer  "user_id"
    t.integer  "version"
    t.integer  "operadora_id"
    t.integer  "monto_cents"
    t.string   "monto_currency", :limit => 3
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.string   "menu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pasajero_versions", :force => true do |t|
    t.integer  "pasajero_id"
    t.integer  "version"
    t.integer  "doc"
    t.string   "name"
    t.date     "nacimiento"
    t.integer  "tdoc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",      :default => false
    t.integer  "user_id"
  end

  add_index "pasajero_versions", ["pasajero_id"], :name => "index_pasajero_versions_on_pasajero_id"

  create_table "pasajeros", :force => true do |t|
    t.integer  "doc"
    t.string   "name"
    t.date     "nacimiento"
    t.integer  "tdoc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "permitions", :id => false, :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "comment_id"
    t.text     "body"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programa_versions", :force => true do |t|
    t.integer  "programa_id"
    t.integer  "version"
    t.string   "name"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",      :default => false
    t.integer  "user_id"
  end

  add_index "programa_versions", ["programa_id"], :name => "index_programa_versions_on_programa_id"

  create_table "programas", :force => true do |t|
    t.string   "name"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "provincias", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reserva_versions", :force => true do |t|
    t.integer  "reserva_id"
    t.integer  "version"
    t.date     "fecha"
    t.date     "salida"
    t.string   "reservado"
    t.string   "operado"
    t.text     "hotel"
    t.string   "periodo"
    t.string   "regimen"
    t.text     "obs"
    t.integer  "thabitacion_id"
    t.integer  "programa_id"
    t.integer  "operadora_id"
    t.integer  "agency_id"
    t.float    "iva"
    t.float    "impuesto"
    t.float    "seguro"
    t.integer  "monto_id"
    t.string   "referencia"
    t.boolean  "cancelada",      :default => false
    t.boolean  "activa",         :default => false
    t.float    "tarifa"
    t.float    "float"
    t.float    "aereo"
    t.float    "otros"
    t.float    "pago_minimo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",         :default => false
    t.integer  "user_id"
    t.date     "voucher"
  end

  add_index "reserva_versions", ["reserva_id"], :name => "index_reserva_versions_on_reserva_id"

  create_table "reservas", :force => true do |t|
    t.date     "fecha"
    t.date     "salida"
    t.string   "reservado"
    t.string   "operado"
    t.text     "hotel"
    t.string   "periodo"
    t.string   "regimen"
    t.text     "obs"
    t.integer  "thabitacion_id"
    t.integer  "programa_id"
    t.integer  "operadora_id"
    t.integer  "agency_id"
    t.float    "iva"
    t.float    "impuesto"
    t.float    "seguro"
    t.integer  "monto_id"
    t.string   "referencia"
    t.boolean  "cancelada",      :default => false
    t.boolean  "activa",         :default => false
    t.float    "tarifa"
    t.float    "float"
    t.float    "aereo"
    t.float    "otros"
    t.float    "pago_minimo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",         :default => false
    t.integer  "user_id"
    t.integer  "version"
    t.date     "voucher"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saldos", :force => true do |t|
    t.integer  "entidad_id"
    t.integer  "operadora_id"
    t.integer  "moneda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "monto_cents"
    t.string   "monto_currency", :limit => 3
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "slogan"
    t.string   "email"
    t.text     "mision"
    t.text     "footer"
    t.string   "style"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tdeposito_versions", :force => true do |t|
    t.integer  "tdeposito_id"
    t.integer  "version"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",       :default => false
    t.integer  "user_id"
  end

  add_index "tdeposito_versions", ["tdeposito_id"], :name => "index_tdeposito_versions_on_tdeposito_id"

  create_table "tdepositos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "tdoc_versions", :force => true do |t|
    t.integer  "tdoc_id"
    t.integer  "version"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
  end

  add_index "tdoc_versions", ["tdoc_id"], :name => "index_tdoc_versions_on_tdoc_id"

  create_table "tdocs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "thabitacion_versions", :force => true do |t|
    t.integer  "thabitacion_id"
    t.integer  "version"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",         :default => false
    t.integer  "user_id"
  end

  add_index "thabitacion_versions", ["thabitacion_id"], :name => "index_thabitacion_versions_on_thabitacion_id"

  create_table "thabitacions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "viajeros", :id => false, :force => true do |t|
    t.integer  "reserva_id"
    t.integer  "pasajero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
