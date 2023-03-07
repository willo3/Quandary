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

ActiveRecord::Schema[7.0].define(version: 2023_03_07_151422) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dilemmas", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "scenario1_id"
    t.bigint "scenario2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_dilemmas_on_game_id"
    t.index ["scenario1_id"], name: "index_dilemmas_on_scenario1_id"
    t.index ["scenario2_id"], name: "index_dilemmas_on_scenario2_id"
  end

  create_table "game_sessions", force: :cascade do |t|
    t.string "avatar_url"
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_sessions_on_game_id"
    t.index ["user_id"], name: "index_game_sessions_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "room_code"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dilemma_id", null: false
    t.bigint "scenario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dilemma_id"], name: "index_results_on_dilemma_id"
    t.index ["scenario_id"], name: "index_results_on_scenario_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "scenarios", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dilemmas", "games"
  add_foreign_key "dilemmas", "scenarios", column: "scenario1_id"
  add_foreign_key "dilemmas", "scenarios", column: "scenario2_id"
  add_foreign_key "game_sessions", "games"
  add_foreign_key "game_sessions", "users"
  add_foreign_key "games", "users"
  add_foreign_key "results", "dilemmas"
  add_foreign_key "results", "scenarios"
  add_foreign_key "results", "users"
end
