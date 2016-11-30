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

ActiveRecord::Schema.define(version: 20161129052949) do

  create_table "customer", force: :cascade do |t|
    t.string   "name",                   limit: 45,               null: false
    t.string   "address",                limit: 200,              null: false
    t.integer  "phone",                  limit: 8,                null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "customer", ["email"], name: "index_customer_on_email", unique: true, using: :btree
  add_index "customer", ["phone"], name: "email_id", unique: true, using: :btree
  add_index "customer", ["reset_password_token"], name: "index_customer_on_reset_password_token", unique: true, using: :btree

  create_table "item", force: :cascade do |t|
    t.string  "type",         limit: 45,                 null: false
    t.string  "name",         limit: 45,                 null: false
    t.string  "description",  limit: 500,                null: false
    t.integer "price",        limit: 4,                  null: false
    t.boolean "availability",             default: true, null: false
  end

  create_table "order", force: :cascade do |t|
    t.string   "customer_id", limit: 45, null: false
    t.string   "show_flag",   limit: 45, null: false
    t.datetime "date",                   null: false
  end

  add_index "order", ["customer_id"], name: "customer_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.string "order_id", limit: 50, null: false
    t.string "item_id",  limit: 50, null: false
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.integer  "quantity",       limit: 4
    t.integer  "item_id",        limit: 4
    t.string   "item_type",      limit: 255
    t.integer  "price_cents",    limit: 4,   default: 0,     null: false
    t.string   "price_currency", limit: 255, default: "USD", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
