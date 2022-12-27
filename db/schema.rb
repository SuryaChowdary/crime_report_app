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

ActiveRecord::Schema.define(version: 2022_12_27_084118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "crime_reporters", force: :cascade do |t|
    t.string "reporter_name"
    t.string "phone"
    t.string "gender"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "crimes", force: :cascade do |t|
    t.bigint "locality_id"
    t.bigint "city_id"
    t.string "name"
    t.text "crime_description"
    t.datetime "crime_time"
    t.string "priority"
    t.boolean "resolved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "crime_reporter_id"
    t.index ["city_id"], name: "index_crimes_on_city_id"
    t.index ["locality_id"], name: "index_crimes_on_locality_id"
  end

  create_table "localities", force: :cascade do |t|
    t.string "street"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "city_id"
  end

end
