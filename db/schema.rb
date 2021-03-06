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

ActiveRecord::Schema.define(version: 20161202051704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.integer  "publish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.boolean  "islike"
    t.integer  "publish_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishes", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "drink_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image"
    t.text     "instructions"
  end

  create_table "us_chal_interactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.string   "interaction"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id", "challenge_id"], name: "index_us_chal_interactions_on_user_id_and_challenge_id", using: :btree
  end

  create_table "user_interactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.string   "interaction"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id", "submission_id"], name: "index_user_interactions_on_user_id_and_submission_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "Username"
    t.string   "Email"
    t.text     "Biography"
    t.boolean  "Isadmin"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "hashedpassword"
    t.string   "passwordsalt"
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
