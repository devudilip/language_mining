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

ActiveRecord::Schema.define(version: 20151031213301) do

  create_table "authors", force: true do |t|
    t.string   "pen_name"
    t.string   "birth_place"
    t.string   "name"
    t.boolean  "sex"
    t.string   "spouse"
    t.string   "time_period"
    t.integer  "poems_found"
    t.text     "information"
    t.integer  "original_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["name"], name: "index_authors_on_name", using: :btree

  create_table "books", force: true do |t|
    t.integer  "author_id"
    t.integer  "language_id"
    t.string   "name"
    t.string   "book_name"
    t.string   "book_volume"
    t.string   "publisher"
    t.string   "published_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "concords", force: true do |t|
    t.string   "name",         null: false
    t.integer  "parent_id"
    t.string   "concord_code", null: false
    t.integer  "count"
    t.text     "ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_poems", force: true do |t|
    t.integer  "poem_id"
    t.date     "published_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "key_words", force: true do |t|
    t.string   "word"
    t.integer  "count"
    t.text     "poem_ids"
    t.text     "author_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "key_words", ["word"], name: "index_key_words_on_word", using: :btree

  create_table "languages", force: true do |t|
    t.string   "language_code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poems", force: true do |t|
    t.integer  "book_id"
    t.integer  "author_id"
    t.string   "name"
    t.text     "poem_text"
    t.integer  "original_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_histories", force: true do |t|
    t.text     "name"
    t.integer  "like_search_count",  default: 0
    t.integer  "exact_search_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
