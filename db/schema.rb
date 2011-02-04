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

ActiveRecord::Schema.define(:version => 20110201140630) do

  create_table "deposito_versions", :force => true do |t|
    t.integer  "deposito_id"
    t.integer  "version"
    t.integer  "tpago_id"
    t.integer  "numero"
    t.integer  "entidad_id"
    t.integer  "movimiento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",        :default => false
    t.integer  "user_id"
  end

  add_index "deposito_versions", ["deposito_id"], :name => "index_deposito_versions_on_deposito_id"

  create_table "depositos", :force => true do |t|
    t.integer  "tpago_id"
    t.integer  "numero"
    t.integer  "entidad_id"
    t.integer  "movimiento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",        :default => false
    t.integer  "user_id"
    t.integer  "version"
  end

  create_table "localidads", :force => true do |t|
    t.string   "name"
    t.integer  "departamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movimientos", :force => true do |t|
    t.date     "fecha"
    t.float    "monto"
    t.integer  "moneda_id"
    t.integer  "tpago"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
