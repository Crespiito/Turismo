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

ActiveRecord::Schema.define(version: 20170606213549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interes_usuarios", force: :cascade do |t|
    t.string   "DNI"
    t.string   "Intereses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intereses_catalogos", force: :cascade do |t|
    t.string   "Nombre"
    t.text     "Descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "marcadors", force: :cascade do |t|
    t.string   "Nombre"
    t.string   "Texto"
    t.string   "Imagen"
    t.string   "Video"
    t.string   "Longitud"
    t.string   "Latitud"
    t.string   "Idadmin"
    t.string   "Idinteres"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuario_admins", primary_key: "IdAdmin", id: :string, force: :cascade do |t|
    t.string   "DNI"
    t.string   "Correo"
    t.string   "Password"
    t.integer  "Aprobado"
    t.integer  "Activo"
    t.string   "Zona"
    t.string   "Interes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuario_generals", primary_key: "DNI", id: :string, force: :cascade do |t|
    t.string   "Nombre"
    t.string   "Direccion"
    t.string   "Telefono"
    t.string   "Ciudad"
    t.string   "Correo"
    t.string   "Genero"
    t.string   "Pais"
    t.string   "Edad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuario_roots", primary_key: "IdRoot", id: :string, force: :cascade do |t|
    t.string   "DNI"
    t.string   "Correo"
    t.string   "Password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuario_suscritos", primary_key: "IdSuscrito", id: :string, force: :cascade do |t|
    t.string   "DNI"
    t.string   "Correo"
    t.string   "Password"
    t.integer  "Aprobado"
    t.integer  "Activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zonas", force: :cascade do |t|
    t.string   "Descripcion"
    t.string   "Longitud"
    t.string   "Latitud"
    t.string   "Superficie"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "interes_usuarios", "usuario_generals", column: "DNI", primary_key: "DNI"
  add_foreign_key "usuario_admins", "usuario_generals", column: "DNI", primary_key: "DNI"
  add_foreign_key "usuario_roots", "usuario_generals", column: "DNI", primary_key: "DNI"
  add_foreign_key "usuario_suscritos", "usuario_generals", column: "DNI", primary_key: "DNI"
end
