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

ActiveRecord::Schema.define(version: 20190712001254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_mailer_reports", force: :cascade do |t|
    t.integer  "eventosbahai_id"
    t.integer  "participant_id"
    t.integer  "mailer_manager_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "to"
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.boolean  "proccessed",        default: false
    t.index ["eventosbahai_id"], name: "index_admin_mailer_reports_on_eventosbahai_id", using: :btree
    t.index ["mailer_manager_id"], name: "index_admin_mailer_reports_on_mailer_manager_id", using: :btree
    t.index ["participant_id"], name: "index_admin_mailer_reports_on_participant_id", using: :btree
    t.index ["user_id"], name: "index_admin_mailer_reports_on_user_id", using: :btree
  end

  create_table "administrative_functions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administrative_regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clusters", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clusters_on_user_id", using: :btree
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
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "sendemail"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "payment"
    t.boolean  "itinerary"
    t.boolean  "share"
    t.boolean  "administrative_function"
    t.index ["user_id"], name: "index_eventosbahais_on_user_id", using: :btree
  end

  create_table "itineraries", force: :cascade do |t|
    t.integer  "transportation"
    t.string   "company"
    t.datetime "departure"
    t.datetime "arrival"
    t.string   "flight_number"
    t.integer  "participant_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "airport_arrival"
    t.string   "airport_departure"
    t.integer  "user_id"
    t.index ["participant_id"], name: "index_itineraries_on_participant_id", using: :btree
  end

  create_table "mailer_participants", force: :cascade do |t|
    t.integer  "mailer_report_id"
    t.integer  "participant_id"
    t.boolean  "sent"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["mailer_report_id"], name: "index_mailer_participants_on_mailer_report_id", using: :btree
    t.index ["participant_id"], name: "index_mailer_participants_on_participant_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "eventosbahai_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "firstaccess",                default: true
    t.string   "autolyse"
    t.integer  "pin"
    t.boolean  "paid",                       default: false
    t.boolean  "phoneconfirmed"
    t.integer  "user_id"
    t.integer  "administrative_function_id"
    t.index ["administrative_function_id"], name: "index_participants_on_administrative_function_id", using: :btree
    t.index ["eventosbahai_id"], name: "index_participants_on_eventosbahai_id", using: :btree
    t.index ["user_id"], name: "index_participants_on_user_id", using: :btree
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.date     "birthday"
    t.string   "email"
    t.string   "phone"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.integer  "number"
    t.string   "zipcode"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.string   "fullname"
    t.integer  "administrative_region_id"
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "role"
    t.string   "authentication_token"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "user_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "admin_mailer_reports", "eventosbahais"
  add_foreign_key "admin_mailer_reports", "participants"
  add_foreign_key "eventosbahais", "users"
  add_foreign_key "itineraries", "participants"
  add_foreign_key "mailer_participants", "admin_mailer_reports", column: "mailer_report_id"
  add_foreign_key "mailer_participants", "participants"
  add_foreign_key "participants", "administrative_functions"
  add_foreign_key "participants", "eventosbahais"
  add_foreign_key "participants", "users"
  add_foreign_key "user_profiles", "administrative_regions"
  add_foreign_key "user_profiles", "users"
end
