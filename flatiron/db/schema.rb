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

ActiveRecord::Schema.define(version: 20150901203752) do

  create_table "cars", force: :cascade do |t|
    t.string   "name"
    t.string   "model_xx"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feature_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string   "name"
    t.integer  "feature_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "features", ["feature_type_id"], name: "index_features_on_feature_type_id"

  create_table "makes", force: :cascade do |t|
    t.string   "vin"
    t.integer  "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "makes", ["car_id"], name: "index_makes_on_car_id"

  create_table "prices", force: :cascade do |t|
    t.string   "price"
    t.string   "currency"
    t.integer  "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "prices", ["make_id"], name: "index_prices_on_make_id"

end
