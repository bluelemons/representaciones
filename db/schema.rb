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

ActiveRecord::Schema.define(:version => 20110115204748) do

  create_table "agencias", :force => true do |t|
    t.string   "name"
    t.integer  "direccion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "direccions", :force => true do |t|
    t.string   "direccion"
    t.integer  "cuit"
    t.string   "telefono"
    t.string   "legajo"
    t.string   "email"
    t.string   "web"
    t.integer  "localidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "localidads", :force => true do |t|
    t.string   "name"
    t.integer  "departamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monedas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operadoras", :force => true do |t|
    t.string   "name"
    t.integer  "direccion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.string   "menu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pagos", :force => true do |t|
    t.date     "fecha"
    t.float    "monto"
    t.integer  "moneda_id"
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

  create_table "posts", :force => true do |t|
    t.integer  "comment_id"
    t.text     "body"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provincias", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reserva_pasajeros", :force => true do |t|
    t.integer  "reserva_id"
    t.integer  "pasajero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "tarifa_pagos", :force => true do |t|
    t.integer  "tarifa_id"
    t.integer  "pago_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  create_table "tdocs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thabitacions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
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
