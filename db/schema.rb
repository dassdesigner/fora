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

ActiveRecord::Schema.define(version: 20150903232416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "author_id",   null: false
    t.text     "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "author_id",  null: false
    t.string   "title",      null: false
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["author_id"], name: "index_questions_on_author_id", using: :btree

  create_table "tag_followings", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tag_followings", ["user_id", "tag_id"], name: "index_tag_followings_on_user_id_and_tag_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",      null: false
    t.integer  "question_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "taggings", ["tag_id", "question_id"], name: "index_taggings_on_tag_id_and_question_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "title",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                                      null: false
    t.string   "password_digest",                                            null: false
    t.string   "session_token",                                              null: false
    t.string   "name",                                                       null: false
    t.string   "description"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "img_src",         default: "http://i.imgur.com/Iw9xtw5.gif"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "value",         default: 0, null: false
    t.integer  "user_id",                   null: false
    t.integer  "voteable_id",               null: false
    t.string   "voteable_type",             null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["voteable_id", "voteable_type"], name: "index_votes_on_voteable_id_and_voteable_type", using: :btree

end
