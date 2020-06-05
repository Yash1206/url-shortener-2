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

ActiveRecord::Schema.define(version: 2020_06_05_124024) do

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_categories_on_title", unique: true
  end

  create_table "counts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "url_id"
    t.index ["url_id"], name: "index_counts_on_url_id"
  end

  create_table "urls", force: :cascade do |t|
    t.string "original", null: false
    t.string "shortened", null: false
    t.boolean "pinned", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.integer "count", default: 0, null: false
    t.index ["category_id"], name: "index_urls_on_category_id"
    t.index ["original", "shortened"], name: "index_urls_on_original_and_shortened", unique: true
  end

  add_foreign_key "counts", "urls"
  add_foreign_key "urls", "categories"
end
