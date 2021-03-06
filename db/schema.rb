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

ActiveRecord::Schema.define(version: 20130917202031) do

  create_table "comments", force: true do |t|
    t.text    "recommendation", limit: 255
    t.integer "trip_detail_id"
    t.integer "user_id"
    t.integer "prospect_id"
  end

  create_table "friends", force: true do |t|
    t.integer "f1"
    t.integer "f2"
    t.boolean "confirmed"
  end

  create_table "prospects", force: true do |t|
    t.string "name"
    t.string "email"
  end

  create_table "trip_details", force: true do |t|
    t.string  "city_or_region"
    t.string  "recommendation_needs"
    t.integer "trip_id"
  end

  create_table "trips", force: true do |t|
    t.string  "trip_name"
    t.integer "userid"
    t.date    "departuredate"
  end

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

end
