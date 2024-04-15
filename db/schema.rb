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

ActiveRecord::Schema[7.0].define(version: 2024_04_15_164634) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "computador_pessoal_memorias_ram", force: :cascade do |t|
    t.bigint "computador_pessoal_id", null: false
    t.bigint "memoria_ram_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computador_pessoal_id"], name: "index_computador_pessoal_memorias_ram_on_computador_pessoal_id"
    t.index ["memoria_ram_id"], name: "index_computador_pessoal_memorias_ram_on_memoria_ram_id"
  end

  create_table "computadores_pessoal", force: :cascade do |t|
    t.bigint "processador_id", null: false
    t.bigint "placa_mae_id", null: false
    t.bigint "placa_de_video_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usuario_id", null: false
    t.index ["placa_de_video_id"], name: "index_computadores_pessoal_on_placa_de_video_id"
    t.index ["placa_mae_id"], name: "index_computadores_pessoal_on_placa_mae_id"
    t.index ["processador_id"], name: "index_computadores_pessoal_on_processador_id"
    t.index ["usuario_id"], name: "index_computadores_pessoal_on_usuario_id"
  end

  create_table "memorias_ram", force: :cascade do |t|
    t.string "descricao"
    t.integer "tamanho"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "montagens", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_montagens_on_usuario_id"
  end

  create_table "placas_de_video", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "placas_mae", force: :cascade do |t|
    t.string "descricao"
    t.integer "tipo_processador"
    t.integer "quantidade_slot_memoria_ram"
    t.integer "total_memoria_ram"
    t.boolean "video_integrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "processadores", force: :cascade do |t|
    t.string "descricao"
    t.integer "marca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "computador_pessoal_memorias_ram", "computadores_pessoal"
  add_foreign_key "computador_pessoal_memorias_ram", "memorias_ram"
  add_foreign_key "computadores_pessoal", "placas_de_video"
  add_foreign_key "computadores_pessoal", "placas_mae"
  add_foreign_key "computadores_pessoal", "processadores"
  add_foreign_key "computadores_pessoal", "usuarios"
  add_foreign_key "montagens", "usuarios"
end
