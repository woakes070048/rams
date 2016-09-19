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

ActiveRecord::Schema.define(version: 20160919063817) do

  create_table "achievements", force: :cascade do |t|
    t.string   "title",        limit: 255, null: false
    t.string   "description",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "achievements", ["candidate_id"], name: "index_achievements_on_candidate_id", using: :btree

  create_table "candidates", force: :cascade do |t|
    t.string   "first_name",     limit: 20,                   null: false
    t.string   "last_name",      limit: 25,                   null: false
    t.date     "dob",                                         null: false
    t.string   "gender",         limit: 255,                  null: false
    t.string   "email",          limit: 100,                  null: false
    t.string   "marital_status", limit: 255
    t.boolean  "status",                       default: true
    t.text     "languages",      limit: 65535
    t.text     "summary",        limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.text     "interests",      limit: 65535
  end

  create_table "course_scores", force: :cascade do |t|
    t.string   "course",           limit: 255, null: false
    t.date     "start_year"
    t.date     "end_year",                     null: false
    t.float    "score",            limit: 24,  null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "qualification_id", limit: 4
  end

  add_index "course_scores", ["qualification_id"], name: "index_course_scores_on_qualification_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.string   "employer_name",   limit: 255,   null: false
    t.string   "start_date",      limit: 255
    t.string   "end_date",        limit: 255
    t.text     "description",     limit: 65535
    t.string   "experience_type", limit: 255
    t.integer  "candidate_id",    limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "experiences", ["candidate_id"], name: "index_experiences_on_candidate_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "type",         limit: 50,  null: false
    t.string   "url",          limit: 255, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "links", ["candidate_id"], name: "index_links_on_candidate_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",        limit: 50,    null: false
    t.string   "domain",       limit: 50
    t.date     "start_date"
    t.date     "end_date",                   null: false
    t.string   "position",     limit: 35,    null: false
    t.string   "organisation", limit: 35,    null: false
    t.text     "information",  limit: 65535, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "projects", ["candidate_id"], name: "index_projects_on_candidate_id", using: :btree

  create_table "qualifications", force: :cascade do |t|
    t.string   "course",       limit: 255, null: false
    t.string   "domain",       limit: 255, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "qualifications", ["candidate_id"], name: "index_qualifications_on_candidate_id", using: :btree

  create_table "references", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.string   "email",        limit: 255
    t.string   "contact",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "references", ["candidate_id"], name: "index_references_on_candidate_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "skill",        limit: 15
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "skills", ["candidate_id"], name: "index_skills_on_candidate_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "achievements", "candidates"
  add_foreign_key "course_scores", "qualifications"
  add_foreign_key "experiences", "candidates"
  add_foreign_key "links", "candidates"
  add_foreign_key "projects", "candidates"
  add_foreign_key "qualifications", "candidates"
  add_foreign_key "references", "candidates"
  add_foreign_key "skills", "candidates"
end
