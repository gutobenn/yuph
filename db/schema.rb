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

ActiveRecord::Schema.define(version: 20131209004728) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["forum_id"], name: "index_categories_on_forum_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["idea_id"], name: "index_follows_on_idea_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "forums", force: true do |t|
    t.string   "password"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forums", ["idea_id"], name: "index_forums_on_idea_id", using: :btree

  create_table "idea_admins", force: true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "idea_admins", ["idea_id"], name: "index_idea_admins_on_idea_id", using: :btree
  add_index "idea_admins", ["user_id"], name: "index_idea_admins_on_user_id", using: :btree

  create_table "idea_comments", force: true do |t|
    t.string   "message"
    t.integer  "idea_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "idea_comments", ["idea_id"], name: "index_idea_comments_on_idea_id", using: :btree
  add_index "idea_comments", ["user_id"], name: "index_idea_comments_on_user_id", using: :btree

  create_table "ideas", force: true do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.text     "mini_description"
    t.text     "description"
    t.string   "video"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "message_sender_id"
    t.integer  "message_receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["message_receiver_id"], name: "index_messages_on_message_receiver_id", using: :btree
  add_index "messages", ["message_sender_id"], name: "index_messages_on_message_sender_id", using: :btree

  create_table "post_comments", force: true do |t|
    t.string   "title"
    t.text     "message"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_comments", ["post_id"], name: "index_post_comments_on_post_id", using: :btree
  add_index "post_comments", ["user_id"], name: "index_post_comments_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "message"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "user_comments", force: true do |t|
    t.text     "message"
    t.integer  "comment_sender_id"
    t.integer  "comment_receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_comments", ["comment_receiver_id"], name: "index_user_comments_on_comment_receiver_id", using: :btree
  add_index "user_comments", ["comment_sender_id"], name: "index_user_comments_on_comment_sender_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "nick"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "access_token_login"
    t.string   "email"
    t.string   "image_file_name"
    t.text     "about"
    t.string   "local"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "access_token"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
