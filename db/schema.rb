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

ActiveRecord::Schema.define(version: 20140701024242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documentaries", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "video_source"
    t.integer  "likes"
    t.integer  "dislikes"
    t.string   "thumbnail_url"
    t.integer  "total_rating"
    t.string   "video_service"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uploader_id"
  end

  add_index "documentaries", ["uploader_id"], name: "index_documentaries_on_uploader_id", using: :btree

  create_table "reviews", force: true do |t|
    t.text     "message"
    t.boolean  "is_positive"
    t.integer  "documentary_id"
    t.integer  "reviewer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["documentary_id"], name: "index_reviews_on_documentary_id", using: :btree
  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string "username"
    t.string "email_address"
    t.string "password_hash"
    t.string "password_salt"
  end

end
