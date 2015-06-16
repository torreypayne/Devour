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

ActiveRecord::Schema.define(version: 20150614014919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer  "deck_id",    null: false
    t.text     "question",   null: false
    t.text     "answer",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cards", ["answer"], name: "index_cards_on_answer", using: :btree
  add_index "cards", ["deck_id"], name: "index_cards_on_deck_id", using: :btree
  add_index "cards", ["question"], name: "index_cards_on_question", using: :btree

  create_table "deck_shares", force: :cascade do |t|
    t.integer  "deck_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "deck_shares", ["deck_id", "user_id"], name: "index_deck_shares_on_deck_id_and_user_id", unique: true, using: :btree

  create_table "decks", force: :cascade do |t|
    t.integer  "owner_id",                  null: false
    t.string   "title",                     null: false
    t.integer  "course_id"
    t.boolean  "public",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "decks", ["owner_id"], name: "index_decks_on_owner_id", using: :btree
  add_index "decks", ["title"], name: "index_decks_on_title", using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id",                   null: false
    t.integer  "card_id",                   null: false
    t.integer  "quality",                   null: false
    t.float    "e_factor",    default: 2.3, null: false
    t.integer  "next_rep",                  null: false
    t.integer  "repetitions", default: 0,   null: false
    t.float    "last_passed",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "responses", ["card_id"], name: "index_responses_on_card_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
