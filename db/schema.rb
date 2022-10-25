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

ActiveRecord::Schema[7.0].define(version: 2022_10_25_165954) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "proposal_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["proposal_id"], name: "index_members_on_proposal_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "attachement"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "abstract"
    t.bigint "theme_id", null: false
    t.index ["theme_id"], name: "index_proposals_on_theme_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "research_centers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.bigint "research_center_id", null: false
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["research_center_id"], name: "index_themes_on_research_center_id"
    t.index ["user_id"], name: "index_themes_on_user_id"
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
    t.string "middle_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "members", "proposals"
  add_foreign_key "members", "users"
  add_foreign_key "proposals", "themes"
  add_foreign_key "proposals", "users"
  add_foreign_key "themes", "research_centers"
  add_foreign_key "themes", "users"
end
