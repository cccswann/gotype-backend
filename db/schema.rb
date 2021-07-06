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

ActiveRecord::Schema.define(version: 2021_07_06_200358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_v1_users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "sentence"
    t.string "sentence_with_furigana"
    t.string "word_base_list", array: true
    t.string "word_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deck_id"
    t.string "translation_word_list", default: [], array: true
    t.string "translation_word_base_list", default: [], array: true
    t.string "translation"
    t.string "image"
    t.string "sound"
    t.index ["deck_id"], name: "index_cards_on_deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string "deck_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "score"
    t.bigint "api_v1_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_v1_user_id"], name: "index_scores_on_api_v1_user_id"
  end

  create_table "texts", force: :cascade do |t|
    t.string "language"
    t.string "words", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "decks"
  add_foreign_key "scores", "api_v1_users"
end
