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

ActiveRecord::Schema.define(version: 20170510190454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

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

  create_table "gasmarks", force: :cascade do |t|
    t.string "gas_mark"
  end

  create_table "gasstations", force: :cascade do |t|
    t.string "gas_station"
  end

  create_table "refills", force: :cascade do |t|
    t.boolean  "full"
    t.decimal  "liters",        precision: 9, scale: 2
    t.decimal  "vartist",       precision: 9, scale: 2
    t.integer  "probig"
    t.decimal  "avg_rozhid",    precision: 9, scale: 2
    t.decimal  "km_na_l",       precision: 9, scale: 2
    t.decimal  "ml_na_ga",      precision: 9, scale: 2
    t.decimal  "avg_uah_km",    precision: 9, scale: 2
    t.decimal  "avg_uah_l",     precision: 9, scale: 2
    t.integer  "car_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "gasstation_id"
    t.integer  "gasmark_id"
    t.integer  "stan_id"
    t.text     "comment"
  end

  create_table "stans", force: :cascade do |t|
    t.string "stan"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "authentications", "users"
end
