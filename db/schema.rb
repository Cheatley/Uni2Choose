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

ActiveRecord::Schema.define(version: 20160621152258) do

  create_table "courses", force: :cascade do |t|
    t.string   "course_title"
    t.string   "ucas_code"
    t.string   "highers"
    t.string   "degree_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "departments"
  end

  create_table "facebooks", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "highers", force: :cascade do |t|
    t.string   "higher"
    t.string   "code_letter"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "keyword"
    t.boolean  "standard_grades"
    t.string   "select_course"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string   "uname"
    t.string   "uregion"
    t.string   "ulogo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "dob"
    t.string   "gender"
    t.string   "postcode"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
