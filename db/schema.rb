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

ActiveRecord::Schema.define(version: 20180428172509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bemvindos", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email",      null: false
    t.text     "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "city"
    t.date     "birth"
    t.string   "address"
  end

  create_table "eventosbahais", force: :cascade do |t|
    t.string   "name"
    t.date     "start_at"
    t.date     "end_at"
    t.string   "city"
    t.string   "state"
    t.string   "location"
    t.string   "theme"
    t.string   "description"
    t.float    "price"
    t.integer  "vacancies"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "sendemail"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "payment"
    t.index ["user_id"], name: "index_eventosbahais_on_user_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "contact"
    t.date     "birthday"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "eventosbahai_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "publist"
    t.boolean  "firstaccess",     default: false
    t.string   "autolyse"
    t.integer  "pin"
    t.boolean  "paid",            default: false
    t.boolean  "phoneconfirmed"
    t.index ["eventosbahai_id"], name: "index_participants_on_eventosbahai_id", using: :btree
  end

  create_table "ruhibooks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_ruhibooks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "privileges"
  end

  add_foreign_key "eventosbahais", "users"
  add_foreign_key "participants", "eventosbahais"
  add_foreign_key "ruhibooks", "users"
end
