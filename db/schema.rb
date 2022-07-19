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

ActiveRecord::Schema[7.0].define(version: 2022_07_19_005103) do
  create_table "bets", force: :cascade do |t|
    t.json "result"
    t.json "move"
    t.integer "dozens"
    t.json "simulations"
    t.integer "Game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Game_id"], name: "index_bets_on_Game_id"
  end

  create_table "game_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_houses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "GameCategory_id", null: false
    t.integer "GameHouse_id", null: false
    t.string "name"
    t.json "last_results"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["GameCategory_id"], name: "index_games_on_GameCategory_id"
    t.index ["GameHouse_id"], name: "index_games_on_GameHouse_id"
  end

  add_foreign_key "bets", "Games"
  add_foreign_key "games", "GameCategories"
  add_foreign_key "games", "GameHouses"
end