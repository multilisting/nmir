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

ActiveRecord::Schema.define(version: 20140627094228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisments", force: true do |t|
    t.integer  "offer_type",                                                        null: false
    t.integer  "property_type",                                                     null: false
    t.integer  "category",                                                          null: false
    t.integer  "agent_category"
    t.integer  "currency"
    t.integer  "period"
    t.integer  "distance"
    t.integer  "time_on_transport"
    t.integer  "time_on_foot"
    t.integer  "agency_id"
    t.integer  "floor_from"
    t.integer  "floor_to"
    t.integer  "floor_cnt_from"
    t.integer  "floor_cnt_to"
    t.integer  "rooms"
    t.datetime "expire_date"
    t.boolean  "payed_adv",                                         default: false
    t.boolean  "manually_added"
    t.boolean  "not_for_agents"
    t.boolean  "mortgage",                                          default: false
    t.string   "name"
    t.string   "sales_agent"
    t.string   "phone"
    t.string   "organization"
    t.string   "space_unit"
    t.decimal  "outdoors_space_from",      precision: 4,  scale: 2
    t.decimal  "outdoors_space_to",        precision: 4,  scale: 2
    t.decimal  "outdoors_space_unit",      precision: 4,  scale: 2
    t.decimal  "price_from",               precision: 10, scale: 2
    t.decimal  "price_to",                 precision: 10, scale: 2
    t.decimal  "unit_price_from",          precision: 4,  scale: 2
    t.decimal  "unit_price_to",            precision: 4,  scale: 2
    t.decimal  "outdoors_unit_price_from", precision: 4,  scale: 2
    t.decimal  "outdoors_unit_price_to",   precision: 4,  scale: 2
    t.decimal  "space_from",               precision: 4,  scale: 2
    t.decimal  "space_to",                 precision: 4,  scale: 2
    t.text     "keywords"
    t.string   "location_name"
    t.integer  "location_id"
    t.string   "country_name"
    t.integer  "country_id"
    t.string   "region_name"
    t.integer  "region_id"
    t.string   "district_name"
    t.integer  "district_id"
    t.string   "locality_name"
    t.integer  "locality_id"
    t.string   "sub_locality_name"
    t.integer  "sub_locality_id"
    t.string   "non_admin_sub_locality"
    t.integer  "address_id"
    t.string   "address_name"
    t.integer  "direction_id"
    t.string   "direction_name"
    t.integer  "metro_id"
    t.string   "metro_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
