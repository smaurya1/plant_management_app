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

ActiveRecord::Schema[7.1].define(version: 2024_03_02_042705) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "health_checks", force: :cascade do |t|
    t.bigint "plant_id"
    t.string "leafColor"
    t.string "pests"
    t.string "root"
    t.string "spots"
    t.string "other"
    t.string "image"
    t.index ["plant_id"], name: "index_health_checks_on_plant_id"
  end

  create_table "personalities", force: :cascade do |t|
    t.string "personality_type", null: false
  end

  create_table "plant_infos", force: :cascade do |t|
    t.bigint "plant_id"
    t.string "scientificName", null: false
    t.string "wateringTimeDays", null: false
    t.string "personality", null: false
    t.string "sun", null: false
    t.string "soil", null: false
    t.string "pests", null: false
    t.string "careLevel", null: false
    t.string "propogation", null: false
    t.string "leaf", null: false
    t.string "fruit", null: false
    t.string "growthRate", null: false
    t.string "origin", null: false
    t.index ["plant_id"], name: "index_plant_infos_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "personality_id"
    t.string "name", null: false
    t.string "species", null: false
    t.time "wateringTime", null: false
    t.string "location", null: false
    t.string "image"
    t.index ["personality_id"], name: "index_plants_on_personality_id"
    t.index ["user_id"], name: "index_plants_on_user_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.bigint "personality_id"
    t.string "text", null: false
    t.index ["personality_id"], name: "index_prompts_on_personality_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "health_checks", "plants"
  add_foreign_key "plant_infos", "plants"
  add_foreign_key "plants", "personalities"
  add_foreign_key "plants", "users"
  add_foreign_key "prompts", "personalities"
end
