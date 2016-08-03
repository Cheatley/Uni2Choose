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

ActiveRecord::Schema.define(version: 20160802110425) do

  create_table "degrees", force: :cascade do |t|
    t.string   "uname"
    t.string   "cname"
    t.string   "ucas"
    t.string   "duration"
    t.string   "qualification"
    t.string   "entry"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "universities_id"
    t.integer  "ucasletters_id"
  end

  add_index "degrees", ["ucasletters_id"], name: "index_degrees_on_ucasletters_id"
  add_index "degrees", ["universities_id"], name: "index_degrees_on_universities_id"

  create_table "highers", force: :cascade do |t|
    t.string   "higher"
    t.string   "code_letter"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "ucasletters_id"
  end

  add_index "highers", ["ucasletters_id"], name: "index_highers_on_ucasletters_id"

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "recommenders", force: :cascade do |t|
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "saved_search"
    t.integer  "users_id"
    t.string   "cname"
    t.string   "uname"
  end

  add_index "searches", ["users_id"], name: "index_searches_on_users_id"

  create_table "similarities", force: :cascade do |t|
    t.string   "ucas_letter"
    t.string   "compared_ucas_letter"
    t.float    "similarity"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
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
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.datetime "dob"
    t.string   "gender"
    t.string   "postcode"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
