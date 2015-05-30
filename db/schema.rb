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

ActiveRecord::Schema.define(version: 20150530153324) do

  create_table "airports", force: :cascade do |t|
    t.string   "airport_code"
    t.string   "airport_name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.integer  "destination_airport_id"
    t.integer  "origin_airport_id"
    t.integer  "miles_flown"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: :cascade do |t|
    t.integer  "t3_threshold"
    t.string   "t3_name"
    t.integer  "t2_threshold"
    t.string   "t2_name"
    t.integer  "t1_threshold"
    t.string   "t1_name"
    t.string   "program_type"
    t.string   "program_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                      default: "", null: false
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "primary_airline_program"
    t.string   "primary_hotel_program"
    t.string   "primary_rental_car_program"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
