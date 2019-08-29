# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_29_034354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "draftees", force: :cascade do |t|
    t.bigint "season_id"
    t.string "name"
    t.integer "round"
    t.integer "year"
    t.string "position"
    t.string "potential"
    t.string "player_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_draftees_on_season_id"
  end

  create_table "franchises", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_franchises_on_created_at", unique: true
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "img"
    t.string "position"
    t.float "salary"
    t.integer "contract_length"
    t.integer "overall"
    t.integer "age"
    t.string "player_type"
    t.text "acquired"
    t.bigint "season_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "real_life_team"
    t.index ["season_id"], name: "index_players_on_season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "year"
    t.bigint "franchise_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_seasons_on_created_at", unique: true
    t.index ["franchise_id"], name: "index_seasons_on_franchise_id"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "wins"
    t.integer "losses"
    t.integer "overtime_losses"
    t.integer "points"
    t.string "results"
    t.string "goal_leader"
    t.integer "goal_total"
    t.string "assist_leader"
    t.integer "assist_total"
    t.string "points_leader"
    t.integer "points_total"
    t.string "wins_leader"
    t.integer "wins_total"
    t.text "notes"
    t.bigint "season_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_stats_on_season_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "season_id"
    t.string "transaction_type"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_transactions_on_season_id"
  end

end
