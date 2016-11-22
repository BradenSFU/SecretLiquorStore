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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161108015840) do
=======
ActiveRecord::Schema.define(version: 20161119015556) do
>>>>>>> 73222ac567fdc9a8479130f28557ff6ac4ff0448

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: :cascade do |t|
    t.boolean  "islike"
    t.integer  "drink_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "structures", force: :cascade do |t|
  end

  create_table "things", force: :cascade do |t|
    t.string   "tname"
    t.text     "description"
    t.integer  "person_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tokimons", force: :cascade do |t|
    t.string   "tname"
    t.integer  "weight"
    t.integer  "height"
    t.integer  "fly"
    t.integer  "fight"
    t.integer  "fire"
    t.integer  "water"
    t.integer  "electric"
    t.integer  "ice"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "pname"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
  create_table "publishes", force: :cascade do |t|
    t.string   "Rname"
    t.integer  "user_id"
    t.integer  "drink_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image"
    t.text     "ingredients"
    t.text     "instructions"
>>>>>>> 73222ac567fdc9a8479130f28557ff6ac4ff0448
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

end
