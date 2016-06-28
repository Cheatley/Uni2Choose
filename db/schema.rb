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

ActiveRecord::Schema.define(version: 20160627110559) do

  create_table "degrees", force: :cascade do |t|
    t.string   "uname"
    t.string   "cname"
    t.string   "ucas"
    t.string   "duration"
    t.string   "qualification"
    t.string   "entry"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "highers", force: :cascade do |t|
    t.string   "higher"
    t.string   "code_letter"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recommenders", force: :cascade do |t|
  end

  create_table "recommends", force: :cascade do |t|
    t.string   "topic"
    t.integer  "a"
    t.integer  "b"
    t.integer  "c"
    t.integer  "d"
    t.integer  "f"
    t.integer  "g"
    t.integer  "h"
    t.integer  "j"
    t.integer  "k"
    t.integer  "l"
    t.integer  "m"
    t.integer  "p"
    t.integer  "q"
    t.integer  "r"
    t.integer  "t"
    t.integer  "v"
    t.integer  "w"
    t.integer  "x"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

end
