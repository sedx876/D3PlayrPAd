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

ActiveRecord::Schema.define(version: 2021_06_30_130648) do

  create_table "characters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "character_klass"
    t.string "helm"
    t.string "shoulders"
    t.string "gloves"
    t.string "chest_armor"
    t.string "belt"
    t.string "pants"
    t.string "boots"
    t.string "bracers"
    t.string "amulet"
    t.string "ring_1"
    t.string "ring_2"
    t.string "weapon"
    t.string "offhand"
    t.text "gem_notes"
    t.text "kanais_cube"
    t.text "active_skills"
    t.text "passive_skills"
    t.text "general_build_notes"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
