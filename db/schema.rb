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

ActiveRecord::Schema.define(version: 2019_11_12_102103) do

  create_table "club_colors", force: :cascade do |t|
    t.integer "club_id"
    t.integer "color_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "club_stats", force: :cascade do |t|
    t.integer "club_id"
    t.integer "seasonGoals_overall"
    t.integer "seasonConceded_overall"
    t.integer "seasonWinsNum_overall"
    t.integer "seasonDrawsNum_overall"
    t.integer "seasonLossesNum_overall"
    t.integer "seasonMatchesPlayed_overall"
    t.integer "seasonCS_overall"
    t.integer "leaguePosition_overall"
    t.integer "average_attendance_home"
    t.integer "cornersTotal_overall"
    t.integer "shotsTotal_overall"
    t.integer "shotsOnTargetTotal_overall"
    t.integer "possessionAVG_overall"
    t.integer "foulsTotal_overall"
    t.integer "offsidesTotal_overall"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "shorthand"
    t.integer "country_id"
    t.string "image"
    t.integer "founded"
    t.integer "stadium_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fs_club_id"
    t.integer "competition_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "hex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fs_league_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "club_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer "scorer_id"
    t.integer "team_id"
    t.integer "assister_id"
    t.integer "match_id"
    t.integer "minute"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "home_id"
    t.integer "away_id"
    t.integer "home_goal_count"
    t.integer "away_goal_count"
    t.integer "stadium_id"
    t.integer "date"
    t.integer "attendance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_stats", force: :cascade do |t|
    t.integer "player_id"
    t.integer "appearances_overall"
    t.integer "minutes_played_overall"
    t.integer "goals_overall"
    t.integer "clean_sheets_overall"
    t.integer "conceded_overall"
    t.integer "penalty_goals"
    t.integer "penalty_misses"
    t.integer "assists_overall"
    t.integer "yellow_cards_overall"
    t.integer "red_cards_overall"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "shorthand"
    t.integer "country_id"
    t.integer "birthday"
    t.integer "position_id"
    t.integer "club_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fs_player_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stadia", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fs_club_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "last_login"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
