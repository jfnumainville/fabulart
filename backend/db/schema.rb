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

ActiveRecord::Schema.define(version: 2023_06_27_011720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pages", force: :cascade do |t|
    t.bigint "story_id", null: false
    t.integer "page_number"
    t.text "page_text"
    t.text "image_prompt"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["story_id"], name: "index_pages_on_story_id"
  end

  create_table "stories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "style"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "prompt_attempts_today"
    t.date "last_prompt_attempt_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pages", "stories"
  add_foreign_key "stories", "users"
end
