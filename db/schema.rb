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

ActiveRecord::Schema.define(version: 20151122212254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tweets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "username"
    t.string   "tweet",      limit: 150
    t.decimal  "lat",                    precision: 16, scale: 2
    t.decimal  "lon",                    precision: 16, scale: 2
    t.string   "country"
    t.integer  "amp",                                             default: 1
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.text     "voters"
  end

  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id", using: :btree
  add_index "tweets", ["username"], name: "index_tweets_on_username", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",                      default: "",    null: false
    t.string   "country"
    t.string   "username",        limit: 40,                 null: false
    t.string   "password_digest"
    t.text     "description"
    t.boolean  "admin",                      default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

end
