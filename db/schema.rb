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

ActiveRecord::Schema.define(version: 20170529144822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_categories", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "avatar"
    t.string   "title"
    t.string   "description"
    t.integer  "owner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lecture_contents", force: :cascade do |t|
    t.string   "actable_type"
    t.integer  "lecture_id"
    t.integer  "serial_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "actable_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string   "title"
    t.integer  "course_id"
    t.integer  "serial_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "markdown_contents", force: :cascade do |t|
    t.string "title"
    t.string "body"
  end

  create_table "sql_problem_contents", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "sql_problem_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sql_problems", force: :cascade do |t|
    t.string   "initial_code"
    t.string   "solution_code"
    t.string   "check_function"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sql_solutions", force: :cascade do |t|
    t.integer  "sql_problem_id"
    t.integer  "user_id"
    t.string   "code"
    t.boolean  "succeed"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "avatar"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.integer  "role",            default: 0
  end

  create_table "video_contents", force: :cascade do |t|
    t.string "url"
  end

  create_table "wikidata_items", force: :cascade do |t|
    t.string   "name"
    t.string   "wikidata_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wikidata_items_to_lecture_contents", force: :cascade do |t|
    t.integer "wikidata_item_id"
    t.integer "lecture_content_id"
    t.integer "priority"
  end

  add_foreign_key "course_categories", "categories"
  add_foreign_key "course_categories", "courses"
  add_foreign_key "courses", "users", column: "owner_id"
  add_foreign_key "groups", "courses"
  add_foreign_key "lecture_contents", "lectures"
  add_foreign_key "lectures", "courses"
  add_foreign_key "sql_problem_contents", "sql_problems"
  add_foreign_key "sql_solutions", "sql_problems"
  add_foreign_key "sql_solutions", "users"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
end
