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

ActiveRecord::Schema.define(version: 20170207035507) do

  create_table "bill_details", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "bill_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_details_on_bill_id"
    t.index ["dish_id"], name: "index_bill_details_on_dish_id"
  end

  create_table "bills", force: :cascade do |t|
    t.integer  "total_price"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "staff_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["staff_id"], name: "index_bills_on_staff_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "image_link"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_dishes_on_category_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_dishes", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_menu_dishes_on_dish_id"
    t.index ["menu_id"], name: "index_menu_dishes_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "order_dishes", force: :cascade do |t|
    t.integer  "order_table_id"
    t.integer  "dish_id"
    t.integer  "quantity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["dish_id"], name: "index_order_dishes_on_dish_id"
    t.index ["order_table_id"], name: "index_order_dishes_on_order_table_id"
  end

  create_table "order_tables", force: :cascade do |t|
    t.datetime "book_from"
    t.datetime "book_to"
    t.integer  "table_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["table_id"], name: "index_order_tables_on_table_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "salary"
    t.integer  "work_days"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_staffs_on_role_id"
  end

  create_table "tables", force: :cascade do |t|
    t.text     "description"
    t.integer  "capacity"
    t.integer  "table_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "isAdmin",         default: false
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
