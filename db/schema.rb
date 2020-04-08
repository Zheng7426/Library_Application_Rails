# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_07_062016) do

  create_table "book_orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_orders_on_book_id"
    t.index ["user_id"], name: "index_book_orders_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "summary"
    t.string "genre"
    t.string "isbn"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "index_books_users_on_book_id"
    t.index ["user_id"], name: "index_books_users_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.text "note"
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_comments_on_book_id"
  end

  create_table "favorite_books", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_favorite_books_on_book_id"
    t.index ["user_id"], name: "index_favorite_books_on_user_id"
  end

  create_table "popularities", force: :cascade do |t|
    t.string "isbn"
    t.integer "future_ranking"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "similarity_matrices", force: :cascade do |t|
    t.string "isbn1"
    t.string "isbn2"
    t.decimal "similarity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "employee_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "book_orders", "books"
  add_foreign_key "book_orders", "users"
  add_foreign_key "books_users", "books"
  add_foreign_key "books_users", "users"
  add_foreign_key "comments", "books"
  add_foreign_key "favorite_books", "books"
  add_foreign_key "favorite_books", "users"
end
