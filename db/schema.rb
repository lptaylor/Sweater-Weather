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

ActiveRecord::Schema.define(version: 2019_02_26_164204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_locations", force: :cascade do |t|
    t.string "location"
  end

  create_table "user_favorite_locations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "favorite_location_id"
    t.index ["favorite_location_id"], name: "index_user_favorite_locations_on_favorite_location_id"
    t.index ["user_id"], name: "index_user_favorite_locations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "api_key"
  end

  add_foreign_key "user_favorite_locations", "favorite_locations"
  add_foreign_key "user_favorite_locations", "users"
end
