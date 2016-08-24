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

ActiveRecord::Schema.define(version: 20160824230121) do

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id"

  create_table "chapters", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chapters", ["book_id"], name: "index_chapters_on_book_id"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.integer  "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employees", ["manager_id"], name: "index_employees_on_manager_id"

  create_table "employment_histories", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employment_histories", ["employee_id"], name: "index_employment_histories_on_employee_id"

  create_table "hiring_records", force: :cascade do |t|
    t.datetime "interview_date"
    t.integer  "start_salary"
    t.datetime "start_date"
    t.integer  "employment_history_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "purchasable_id"
    t.string   "purchasable_type"
    t.integer  "item_price"
    t.integer  "quantity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.string   "shipping_address"
    t.datetime "shipping_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "reviewable_id"
    t.string   "reviewable_type"
    t.integer  "rating"
    t.string   "text"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "reviews", ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"

  create_table "videos", force: :cascade do |t|
    t.string   "name"
    t.integer  "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
