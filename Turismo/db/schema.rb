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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170421054424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuenta", force: :cascade do |t|
    t.string   "Correo"
    t.string   "Password"
    t.string   "Cargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interes", force: :cascade do |t|
    t.integer  "DNI"
    t.string   "Interes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.integer  "DNI"
    t.string   "Nombre"
    t.string   "Direccion"
    t.string   "Ciudad"
    t.string   "Pais"
    t.integer  "Telefono"
    t.string   "Correo"
    t.string   "Genero"
    t.integer  "Edad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
