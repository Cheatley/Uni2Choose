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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160624192238) do
=======
ActiveRecord::Schema.define(version: 20160624145747) do
>>>>>>> 601f954e93e18cc0b2aed138919066fb31e6640c


  create_table "highers", force: :cascade do |t|
    t.string   "higher"
    t.string   "code_letter"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "not_interested"
    t.string   "select_course1"
    t.string   "select_course2"
    t.string   "select_course3"
    t.string   "select_course4"
    t.string   "select_course5"
  end

<<<<<<< HEAD
  create_table "sucs", force: :cascade do |t|
=======
  create_table "similarities", force: :cascade do |t|
    t.string   "ucas_letter"
    t.string   "compared_ucas_letter"
    t.float    "similarity"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
>>>>>>> 601f954e93e18cc0b2aed138919066fb31e6640c
  end

  create_table "ucasletters", force: :cascade do |t|
    t.string   "ucas_letter"
    t.string   "subject_group"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "uname"
    t.string "uregion"
    t.string "ulogo"
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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
