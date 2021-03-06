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

ActiveRecord::Schema.define(version: 20161101160103) do

  create_table "authors", force: :cascade do |t|
    t.string   "pen_name",    limit: 255
    t.string   "birth_place", limit: 255
    t.string   "name",        limit: 255
    t.boolean  "sex"
    t.string   "spouse",      limit: 255
    t.string   "time_period", limit: 255
    t.integer  "poems_found", limit: 4
    t.text     "information", limit: 65535
    t.integer  "original_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["name"], name: "index_authors_on_name", using: :btree

  create_table "books", force: :cascade do |t|
    t.integer  "author_id",      limit: 4
    t.integer  "language_id",    limit: 4
    t.string   "name",           limit: 255
    t.string   "book_name",      limit: 255
    t.string   "book_volume",    limit: 255
    t.string   "publisher",      limit: 255
    t.string   "published_year", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "concords", force: :cascade do |t|
    t.string   "name",         limit: 255,        null: false
    t.integer  "parent_id",    limit: 4
    t.string   "concord_code", limit: 255,        null: false
    t.integer  "count",        limit: 4
    t.text     "ids",          limit: 4294967295
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_poems", force: :cascade do |t|
    t.integer  "poem_id",        limit: 4
    t.date     "published_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "key_words", force: :cascade do |t|
    t.string   "word",       limit: 255
    t.integer  "count",      limit: 4
    t.text     "poem_ids",   limit: 4294967295
    t.text     "author_ids", limit: 4294967295
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "key_words", ["word"], name: "index_key_words_on_word", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "language_code", limit: 255
    t.string   "name",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poems", force: :cascade do |t|
    t.integer  "book_id",     limit: 4
    t.integer  "author_id",   limit: 4
    t.string   "name",        limit: 255
    t.text     "poem_text",   limit: 65535
    t.integer  "original_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_histories", force: :cascade do |t|
    t.text     "name",               limit: 65535
    t.integer  "like_search_count",  limit: 4,     default: 0
    t.integer  "exact_search_count", limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
