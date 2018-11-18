# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_13_214009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "adventure_dragons", force: :cascade do |t|
    t.bigint "adventure_id"
    t.bigint "dragon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adventure_id"], name: "index_adventure_dragons_on_adventure_id"
    t.index ["dragon_id"], name: "index_adventure_dragons_on_dragon_id"
  end

  create_table "adventure_resources", force: :cascade do |t|
    t.bigint "adventure_id"
    t.bigint "resource_type_id"
    t.integer "chance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adventure_id"], name: "index_adventure_resources_on_adventure_id"
    t.index ["resource_type_id"], name: "index_adventure_resources_on_resource_type_id"
  end

  create_table "adventures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dragon_costs", force: :cascade do |t|
    t.bigint "dragon_type_id"
    t.bigint "resource_type_id"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dragon_type_id"], name: "index_dragon_costs_on_dragon_type_id"
    t.index ["resource_type_id"], name: "index_dragon_costs_on_resource_type_id"
  end

  create_table "dragon_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dragons", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "dragon_type_id"
    t.integer "level"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dragon_type_id"], name: "index_dragons_on_dragon_type_id"
    t.index ["user_id"], name: "index_dragons_on_user_id"
  end

  create_table "resource_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "resource_type_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type_id"], name: "index_resources_on_resource_type_id"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level"
    t.integer "experience", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adventure_dragons", "adventures"
  add_foreign_key "adventure_dragons", "dragons"
  add_foreign_key "adventure_resources", "adventures"
  add_foreign_key "adventure_resources", "resource_types"
  add_foreign_key "dragon_costs", "dragon_types"
  add_foreign_key "dragon_costs", "resource_types"
  add_foreign_key "dragons", "dragon_types"
  add_foreign_key "dragons", "users"
  add_foreign_key "resources", "resource_types"
  add_foreign_key "resources", "users"
end
