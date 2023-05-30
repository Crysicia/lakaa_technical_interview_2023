# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_30_225340) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collection_indicators", force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.bigint "indicator_id", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collection_indicators_on_collection_id"
    t.index ["indicator_id"], name: "index_collection_indicators_on_indicator_id"
  end

  create_table "collections", force: :cascade do |t|
    t.datetime "collected_at", null: false
    t.string "organization_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicators", force: :cascade do |t|
    t.string "name", null: false
    t.string "unit", null: false
    t.boolean "required", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted", default: false, null: false
  end

  add_foreign_key "collection_indicators", "collections"
  add_foreign_key "collection_indicators", "indicators"
end
