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

ActiveRecord::Schema.define(version: 20140922203226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pitches", force: true do |t|
    t.string   "pitch_to"
    t.text     "pitch_notes"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.boolean  "listened_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "song_selections", force: true do |t|
    t.integer  "song_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "song_id"
    t.integer  "pitch_id"
  end

  add_index "song_selections", ["pitch_id"], name: "index_song_selections_on_pitch_id", using: :btree
  add_index "song_selections", ["song_id"], name: "index_song_selections_on_song_id", using: :btree

  create_table "songs", force: true do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "genre"
    t.text     "description"
    t.string   "audiofile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "crypted_password",             null: false
    t.string   "salt",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "username"
  end

  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
