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

ActiveRecord::Schema.define(version: 20150831201510) do

  create_table "addresses", force: :cascade do |t|
    t.string   "line_1"
    t.string   "line_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "zip_id"
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id"
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id"
  add_index "addresses", ["zip_id"], name: "index_addresses_on_zip_id"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "person_id"
  end

  add_index "emails", ["person_id"], name: "index_emails_on_person_id"

  create_table "home_performance_statuses", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.integer  "residence_id"
    t.integer  "person_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "homes", ["person_id"], name: "index_homes_on_person_id"
  add_index "homes", ["residence_id"], name: "index_homes_on_residence_id"

  create_table "lead_sources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "email_id"
    t.integer  "phone_number_id"
  end

  add_index "people", ["email_id"], name: "index_people_on_email_id"
  add_index "people", ["phone_number_id"], name: "index_people_on_phone_number_id"

  create_table "person_leads", force: :cascade do |t|
    t.integer  "lead_source_id"
    t.integer  "person_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "person_leads", ["lead_source_id"], name: "index_person_leads_on_lead_source_id"
  add_index "person_leads", ["person_id"], name: "index_person_leads_on_person_id"

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "person_id"
  end

  add_index "phone_numbers", ["person_id"], name: "index_phone_numbers_on_person_id"

  create_table "residences", force: :cascade do |t|
    t.integer  "square_footage"
    t.boolean  "own"
    t.integer  "address_id"
    t.boolean  "apartment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "account_number"
    t.integer  "utility_id"
  end

  add_index "residences", ["address_id"], name: "index_residences_on_address_id"
  add_index "residences", ["utility_id"], name: "index_residences_on_utility_id"

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "address_id"
  end

  add_index "states", ["address_id"], name: "index_states_on_address_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "task"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "utilities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zips", force: :cascade do |t|
    t.string   "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
