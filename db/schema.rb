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

ActiveRecord::Schema.define(version: 20130821015252) do

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "idea_admins", force: true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "idea_comments", force: true do |t|
    t.string   "title"
    t.string   "message"
    t.integer  "idea_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "mini_description"
    t.text     "description"
    t.string   "video"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nick"
    t.string   "password"
    t.string   "email"
    t.string   "image"
    t.text     "about"
    t.string   "local"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
