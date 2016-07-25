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

ActiveRecord::Schema.define(version: 20160725205623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "home_id",      null: false
    t.string   "name",         null: false
    t.float    "amount",       null: false
    t.datetime "due"
    t.datetime "created_at",   null: false
    t.datetime "completed_at"
  end

  create_table "chores", force: :cascade do |t|
    t.integer  "chore_creator_id"
    t.integer  "home_id",                            null: false
    t.string   "name",                               null: false
    t.text     "description"
    t.float    "bill_value"
    t.integer  "votes"
    t.integer  "thumbs_up"
    t.datetime "created_at",                         null: false
    t.datetime "completed_at"
    t.integer  "chore_completer_id"
    t.integer  "chore_assignee_id"
    t.string   "avatar"
    t.integer  "chore_xp"
    t.boolean  "completed",          default: false
  end

  create_table "homes", force: :cascade do |t|
    t.integer  "creator_id", null: false
    t.string   "name",       null: false
    t.float    "rent"
    t.string   "city"
    t.datetime "created_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "item_xp"
    t.integer  "item_creator"
    t.integer  "purchaser_id"
    t.integer  "list_id"
    t.integer  "home_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "purchased",    default: false
    t.datetime "purchased_at"
  end

  create_table "lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "home_id",      null: false
    t.string   "name",         null: false
    t.datetime "created_at",   null: false
    t.datetime "completed_at"
  end

  create_table "user_homes", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "home_id",                    null: false
    t.integer  "exp",        default: 0,     null: false
    t.boolean  "admin",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.integer  "user_level"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "site_admin",             default: false
    t.string   "avatar"
    t.string   "venmo_username"
    t.string   "venmo_email"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

end
