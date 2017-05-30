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

ActiveRecord::Schema.define(version: 20170530033731) do

  create_table "cars", force: :cascade do |t|
    t.string   "license_number", limit: 255
    t.integer  "car_type",       limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "deleted_at"
  end

  add_index "cars", ["deleted_at"], name: "index_cars_on_deleted_at", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "car_id",     limit: 4
    t.boolean  "mud_in_bed",            default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.float    "total",      limit: 24
    t.datetime "deleted_at"
    t.boolean  "bed_down",              default: false
  end

  add_index "transactions", ["car_id"], name: "index_transactions_on_car_id", using: :btree
  add_index "transactions", ["deleted_at"], name: "index_transactions_on_deleted_at", using: :btree

end
