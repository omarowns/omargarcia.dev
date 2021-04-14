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

ActiveRecord::Schema.define(version: 2021_04_14_060034) do

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
    t.string "additional"
    t.boolean "active", default: false
    t.index ["profile_id"], name: "index_abouts_on_profile_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "image_proxies", force: :cascade do |t|
    t.boolean "main"
    t.boolean "featured"
    t.integer "position"
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.bigint "image_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_id"], name: "index_image_proxies_on_image_id"
    t.index ["imageable_type", "imageable_id"], name: "index_image_proxies_on_imageable"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interest_groups", force: :cascade do |t|
    t.string "title"
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "additional"
    t.boolean "active", default: false
    t.index ["profile_id"], name: "index_interest_groups_on_profile_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "value"
    t.integer "position"
    t.bigint "interest_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interest_group_id"], name: "index_interests_on_interest_group_id"
  end

  create_table "location_groups", force: :cascade do |t|
    t.string "title"
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "additional"
    t.boolean "active", default: false
    t.index ["profile_id"], name: "index_location_groups_on_profile_id"
  end

  create_table "location_proxies", force: :cascade do |t|
    t.integer "position"
    t.string "locatable_type", null: false
    t.bigint "locatable_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["locatable_type", "locatable_id"], name: "index_location_proxies_on_locatable"
    t.index ["location_id"], name: "index_location_proxies_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "additional"
    t.boolean "active", default: false
    t.index ["profile_id"], name: "index_work_groups_on_profile_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "title"
    t.string "additional"
    t.string "link"
    t.string "duration"
    t.string "image_pack_tag"
    t.bigint "work_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["work_group_id"], name: "index_works_on_work_group_id"
  end

  add_foreign_key "about_lines", "abouts"
  add_foreign_key "abouts", "profiles"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "image_proxies", "images"
  add_foreign_key "interest_groups", "profiles"
  add_foreign_key "interests", "interest_groups"
  add_foreign_key "location_groups", "profiles"
  add_foreign_key "location_proxies", "locations"
  add_foreign_key "work_groups", "profiles"
  add_foreign_key "works", "work_groups"
end
