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

ActiveRecord::Schema.define(version: 20170219091749) do

  create_table "cars", force: :cascade do |t|
    t.string   "name"
    t.integer  "total_probig"
    t.decimal  "total_vartist", precision: 9, scale: 2
    t.decimal  "total_liters",  precision: 9, scale: 2
    t.decimal  "avg_rozhid",    precision: 9, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "refills", force: :cascade do |t|
    t.boolean  "full"
    t.decimal  "liters",      precision: 9, scale: 2
    t.decimal  "vartist",     precision: 9, scale: 2
    t.integer  "probig"
    t.decimal  "avg_rozhid",  precision: 9, scale: 2
    t.decimal  "km_na_l",     precision: 9, scale: 2
    t.decimal  "ml_na_ga",    precision: 9, scale: 2
    t.decimal  "avg_uah_km",  precision: 9, scale: 2
    t.decimal  "avg_uah_l",   precision: 9, scale: 2
    t.integer  "car_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "gas_station"
    t.string   "gas_mark"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
