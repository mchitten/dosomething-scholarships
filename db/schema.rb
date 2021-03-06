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

ActiveRecord::Schema.define(version: 20130925220314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ds_auth_users", force: true do |t|
    t.string   "email"
    t.integer  "fbid"
    t.integer  "uid"
    t.boolean  "is_admin"
    t.string   "mobile"
    t.string   "signup_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "share_a_stat_posts", force: true do |t|
    t.string   "my_name"
    t.string   "my_number"
    t.string   "friend_1"
    t.string   "friend_2"
    t.string   "friend_3"
    t.string   "friend_4"
    t.string   "friend_5"
    t.string   "friend_6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "share_a_stat_id"
  end

  create_table "share_a_stats", force: true do |t|
    t.string   "title"
    t.text     "message"
    t.string   "image"
    t.string   "tip"
    t.integer  "mc_alpha"
    t.integer  "mc_beta"
    t.string   "redirect"
    t.text     "redirect_message"
    t.string   "color_scheme"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "rules"
  end

end
