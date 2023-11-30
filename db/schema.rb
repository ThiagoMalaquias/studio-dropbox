# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_30_155018) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradores", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grupo_usuarios", force: :cascade do |t|
    t.bigint "grupo_id", null: false
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grupo_id"], name: "index_grupo_usuarios_on_grupo_id"
    t.index ["usuario_id"], name: "index_grupo_usuarios_on_usuario_id"
  end

  create_table "grupos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "midias", force: :cascade do |t|
    t.text "arquivo"
    t.bigint "pasta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pasta_id"], name: "index_midias_on_pasta_id"
  end

  create_table "pasta_grupos", force: :cascade do |t|
    t.bigint "pasta_id", null: false
    t.bigint "grupo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grupo_id"], name: "index_pasta_grupos_on_grupo_id"
    t.index ["pasta_id"], name: "index_pasta_grupos_on_pasta_id"
  end

  create_table "pastas", force: :cascade do |t|
    t.string "nome"
    t.string "link"
    t.string "origem_type"
    t.bigint "origem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["origem_type", "origem_id"], name: "index_pastas_on_origem"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "grupo_usuarios", "grupos"
  add_foreign_key "grupo_usuarios", "usuarios"
  add_foreign_key "midias", "pastas"
  add_foreign_key "pasta_grupos", "grupos"
  add_foreign_key "pasta_grupos", "pastas"
end
