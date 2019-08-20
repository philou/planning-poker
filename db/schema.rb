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

ActiveRecord::Schema.define(version: 2017_05_12_070029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributors", id: :serial, force: :cascade do |t|
    t.text "name"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estimations", force: :cascade do |t|
    t.bigint "contributor_id"
    t.bigint "vote_id"
    t.integer "story_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributor_id"], name: "index_estimations_on_contributor_id"
    t.index ["vote_id"], name: "index_estimations_on_vote_id"
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "animator_id"
    t.integer "lock_version"
    t.integer "current_vote_id"
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "ending"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ending"], name: "index_votes_on_ending"
    t.index ["team_id"], name: "index_votes_on_team_id"
  end

  add_foreign_key "estimations", "contributors"
  add_foreign_key "estimations", "votes"
  add_foreign_key "teams", "contributors", column: "animator_id"
  add_foreign_key "teams", "votes", column: "current_vote_id"
  add_foreign_key "votes", "teams"
end
