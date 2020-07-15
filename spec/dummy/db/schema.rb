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

ActiveRecord::Schema.define(version: 2020_07_13_135025) do

  create_table "mkd_philippines_philippines", primary_key: "code", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "type"
    t.string "name", null: false
    t.string "geographic_level", null: false
    t.string "city_class"
    t.string "income_classification"
    t.string "rural_urban"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_mkd_philippines_philippines_on_code"
  end

end
