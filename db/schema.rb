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

ActiveRecord::Schema[7.1].define(version: 2024_02_25_000743) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # create_table "chatgpts", force: :cascade do |t|
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end

  create_table "personalities", force: :cascade do |t|
    t.string "personality_type", null: false
  end

  create_table "plants", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "personality_id"
    t.string "name", null: false
    t.string "species", null: false
    t.string "wateringTime", null: false
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

  add_foreign_key "plants", "personalities"
  add_foreign_key "plants", "users"
  add_foreign_key "prompts", "personalities"
end
