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

ActiveRecord::Schema.define(version: 20160422083336) do

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "state"
    t.integer  "users_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  add_index "products", ["users_id"], name: "index_products_on_users_id"

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.datetime "expires_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id"

  create_table "transactions", force: :cascade do |t|
    t.integer  "product_req_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "product_offered_id"
    t.boolean  "state"
  end

  add_index "transactions", ["product_req_id"], name: "index_transactions_on_product_req_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
