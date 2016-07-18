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

ActiveRecord::Schema.define(version: 20160715184409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "homes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.float "rent"
    t.string "city"
    t.datetime "created_at"
  end

  create_table "chores", force: :cascade do |t|
    t.integer "user_id"
    t.integer "home_id", null: false
    t.string "name", null: false
    t.text "description"
    t.float "bill_value"
    t.integer "value", null: false
    t.integer "votes"
    t.integer "thumbs_up"
    t.datetime "created_at", null: false
    t.datetime "completed_at"
  end

  create_table "bills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "home_id", null: false
    t.string "name", null: false
    t.float "amount", null: false
    t.datetime "due"
    t.datetime "created_at", null: false
    t.datetime "completed_at"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "home_id", null: false
    t.string "name", null: false
    t.string "item", null: false
    t.datetime "created_at", null: false
    t.datetime "completed_at"
  end


end
