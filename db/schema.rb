# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150424114245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.decimal  "longtitude", precision: 8, scale: 5
    t.decimal  "latitude",   precision: 8, scale: 5
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "timezone"
  end

  create_table "precipitations", force: :cascade do |t|
    t.decimal  "amount",     precision: 8, scale: 5
    t.integer  "reading_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.decimal  "since_nine", precision: 8, scale: 5
  end

  add_index "precipitations", ["reading_id"], name: "index_precipitations_on_reading_id", using: :btree

  create_table "readings", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "source_id"
    t.datetime "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "readings", ["location_id"], name: "index_readings_on_location_id", using: :btree
  add_index "readings", ["source_id"], name: "index_readings_on_source_id", using: :btree

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temperatures", force: :cascade do |t|
    t.decimal  "value",      precision: 8, scale: 5
    t.decimal  "dew_point",  precision: 8, scale: 5
    t.integer  "reading_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "temperatures", ["reading_id"], name: "index_temperatures_on_reading_id", using: :btree

  create_table "winds", force: :cascade do |t|
    t.string   "direction"
    t.decimal  "speed",      precision: 8, scale: 5
    t.integer  "reading_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "winds", ["reading_id"], name: "index_winds_on_reading_id", using: :btree

  add_foreign_key "precipitations", "readings"
  add_foreign_key "temperatures", "readings"
  add_foreign_key "winds", "readings"
end
