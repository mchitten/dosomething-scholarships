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

ActiveRecord::Schema.define(version: 20130906155004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "share_a_stats", force: true do |t|
    t.string   "title"
    t.text     "message"
    t.string   "image"
    t.boolean  "scholarship"
    t.string   "tip"
    t.integer  "mc_alpha"
    t.integer  "mc_beta"
    t.string   "redirect"
    t.text     "redirect_message"
    t.integer  "campaign_id"
    t.string   "color_scheme"
    t.string   "logo"
    t.string   "logo_text"
    t.string   "shortform_image"
    t.string   "shortform_bucket"
    t.string   "sponsor_image"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "shortform_image_file_name"
    t.string   "shortform_image_content_type"
    t.integer  "shortform_image_file_size"
    t.datetime "shortform_image_updated_at"
    t.string   "sponsor_image_file_name"
    t.string   "sponsor_image_content_type"
    t.integer  "sponsor_image_file_size"
    t.datetime "sponsor_image_updated_at"
  end

end
