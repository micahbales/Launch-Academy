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

ActiveRecord::Schema.define(version: 20151216120229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.integer  "video_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["video_id"], name: "index_comments_on_video_id", using: :btree

  create_table "formats", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "formats", ["name"], name: "index_formats_on_name", unique: true, using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "genres", ["name"], name: "index_genres_on_name", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.integer  "year"
    t.integer  "genre_id"
    t.integer  "format_id",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "videos", ["format_id"], name: "index_videos_on_format_id", using: :btree
  add_index "videos", ["genre_id"], name: "index_videos_on_genre_id", using: :btree

  add_foreign_key "comments", "videos"
  add_foreign_key "videos", "formats"
  add_foreign_key "videos", "genres"
end
