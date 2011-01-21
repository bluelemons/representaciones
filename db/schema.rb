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

ActiveRecord::Schema.define(:version => 20110121151856) do

  create_table "agencia_versions", :force => true do |t|
    t.integer  "agencia_id"
    t.integer  "version"
    t.string   "name"
    t.integer  "direccion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",       :default => false
    t.integer  "user_id"
  end

  add_index "agencia_versions", ["agencia_id"], :name => "index_agencia_versions_on_agencia_id"

  create_table "agencias", :force => true do |t|
    t.string   "name"
    t.integer  "direccion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",       :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

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

  create_table "departamentos", :force => true do |t|
    t.string   "name"
    t.integer  "provincia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "direccion_versions", :force => true do |t|
    t.integer  "direccion_id"
    t.integer  "version"
    t.string   "calle"
    t.integer  "cuit"
    t.string   "telefono"
    t.string   "legajo"
    t.string   "email"
    t.string   "web"
    t.integer  "localidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",       :default => false
    t.integer  "user_id"
  end

  add_index "direccion_versions", ["direccion_id"], :name => "index_direccion_versions_on_direccion_id"

  create_table "direccions", :force => true do |t|
    t.string   "calle"
    t.integer  "cuit"
    t.string   "telefono"
    t.string   "legajo"
    t.string   "email"
    t.string   "web"
    t.integer  "localidad_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
  end

  add_index "moneda_versions", ["moneda_id"], :name => "index_moneda_versions_on_moneda_id"

  create_table "monedas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "operadora_versions", :force => true do |t|
    t.integer  "operadora_id"
    t.integer  "version"
    t.string   "name"
    t.integer  "direccion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",       :default => false
    t.integer  "user_id"
  end

  add_index "operadora_versions", ["operadora_id"], :name => "index_operadora_versions_on_operadora_id"

  create_table "operadoras", :force => true do |t|
    t.string   "name"
    t.integer  "direccion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",       :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.string   "menu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pago_versions", :force => true do |t|
    t.integer  "pago_id"
    t.integer  "version"
    t.date     "fecha"
    t.float    "monto"
    t.integer  "moneda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
  end

  add_index "pago_versions", ["pago_id"], :name => "index_pago_versions_on_pago_id"

  create_table "pagos", :force => true do |t|
    t.date     "fecha"
    t.float    "monto"
    t.integer  "moneda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
    t.integer  "version"
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

  create_table "pasajeros_reservas", :id => false, :force => true do |t|
    t.integer  "pasajero_id"
    t.integer  "reserva_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",      :default => false
    t.integer  "user_id"
  end

  add_index "programa_versions", ["programa_id"], :name => "index_programa_versions_on_programa_id"

  create_table "programas", :force => true do |t|
    t.string   "name"
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
    t.integer  "activa"
    t.string   "reservado"
    t.string   "hotel"
    t.integer  "periodo"
    t.string   "regimen"
    t.text     "obs"
    t.integer  "thabitacion_id"
    t.integer  "programa_id"
    t.integer  "operadora_id"
    t.integer  "agencia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",         :default => false
    t.integer  "user_id"
  end

  add_index "reserva_versions", ["reserva_id"], :name => "index_reserva_versions_on_reserva_id"

  create_table "reservas", :force => true do |t|
    t.date     "fecha"
    t.date     "salida"
    t.integer  "activa"
    t.string   "reservado"
    t.string   "hotel"
    t.integer  "periodo"
    t.string   "regimen"
    t.text     "obs"
    t.integer  "thabitacion_id"
    t.integer  "programa_id"
    t.integer  "operadora_id"
    t.integer  "agencia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",         :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "tarifa_versions", :force => true do |t|
    t.integer  "tarifa_id"
    t.integer  "version"
    t.float    "iva"
    t.integer  "impuesto"
    t.float    "monto"
    t.float    "comision"
    t.float    "efectivo"
    t.float    "anticipo"
    t.string   "obs"
    t.integer  "reserva_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
    t.integer  "user_id"
  end

  add_index "tarifa_versions", ["tarifa_id"], :name => "index_tarifa_versions_on_tarifa_id"

  create_table "tarifas", :force => true do |t|
    t.float    "iva"
    t.integer  "impuesto"
    t.float    "monto"
    t.float    "comision"
    t.float    "efectivo"
    t.float    "anticipo"
    t.string   "obs"
    t.integer  "reserva_id"
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
    t.string   "password_salt"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
