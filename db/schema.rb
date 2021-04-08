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

ActiveRecord::Schema.define(version: 2021_04_08_023313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_lines", force: :cascade do |t|
    t.string "line"
    t.integer "position"
    t.bigint "about_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["about_id"], name: "index_about_lines_on_about_id"
  end

  create_table "abouts", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "profile_id", null: false
    t.index ["profile_id"], name: "index_abouts_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "title"
    t.string "animoji"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_groups", force: :cascade do |t|
    t.string "title"
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_work_groups_on_profile_id"
  end

  add_foreign_key "about_lines", "abouts"
  add_foreign_key "abouts", "profiles"
  add_foreign_key "work_groups", "profiles"
end
