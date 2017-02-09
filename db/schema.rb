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

ActiveRecord::Schema.define(version: 20161013101610) do

  create_table "customers", force: true do |t|
    t.string   "email_for_index", null: false
    t.string   "name",            null: false
    t.string   "name_kana"
    t.string   "hashed_password"
    t.string   "image_url"
    t.string   "instagram_url"
    t.string   "instagram_name"
    t.string   "facebook_url"
    t.string   "facebook_name"
    t.string   "twitter_url"
    t.string   "twitter_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["email_for_index"], name: "index_customers_on_email_for_index", unique: true, using: :btree
  add_index "customers", ["name_kana"], name: "index_customers_on_name_kana", using: :btree

  create_table "emails", force: true do |t|
    t.integer  "customer_id", null: false
    t.string   "main",        null: false
    t.string   "sub_1"
    t.string   "sub_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
