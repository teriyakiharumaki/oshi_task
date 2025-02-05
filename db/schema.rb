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

ActiveRecord::Schema[7.1].define(version: 2025_01_17_034549) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ai_comments", force: :cascade do |t|
    t.text "task_created_comment"
    t.text "task_updated_comment"
    t.text "task_deleted_comment"
    t.text "task_completed_comment"
    t.text "sub_task_completed_comment"
    t.text "task_incomplete_comment"
    t.bigint "oshi_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["oshi_profile_id"], name: "index_ai_comments_on_oshi_profile_id"
  end

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "oshi_profiles", force: :cascade do |t|
    t.string "name"
    t.string "personality"
    t.string "generation"
    t.string "gender"
    t.string "pronoun"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["user_id"], name: "index_oshi_profiles_on_user_id"
  end

  create_table "subtasks", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.boolean "done", default: false
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "body"
    t.boolean "done", default: false
  end

  create_table "third_tasks", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.boolean "done", default: false
    t.integer "subtask_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "ai_comments", "oshi_profiles"
  add_foreign_key "oshi_profiles", "users"
end
