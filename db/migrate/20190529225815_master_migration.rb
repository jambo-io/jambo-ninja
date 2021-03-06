class MasterMigration < ActiveRecord::Migration[5.0]
  def change
    create_table "administrative_functions", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
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
  
    create_table "clusters", force: :cascade do |t|
      t.string   "name"
      t.string   "city"
      t.string   "state"
      t.integer  "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_clusters_on_user_id", using: :btree
    end
  
    create_table "conferenciasdeunidades", force: :cascade do |t|
      t.string   "name"
      t.string   "location"
      t.date     "start_at"
      t.date     "end_at"
      t.text     "description"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end
  
    create_table "contacts", force: :cascade do |t|
      t.string   "name"
      t.string   "lastname"
      t.date     "birthday"
      t.string   "email"
      t.string   "phone"
      t.string   "state"
      t.string   "city"
      t.string   "address"
      t.string   "number"
      t.string   "pc"
      t.string   "activities"
      t.boolean  "video"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
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
      t.datetime "created_at",     null: false
      t.datetime "updated_at",     null: false
      t.index ["participant_id"], name: "index_itineraries_on_participant_id", using: :btree
    end
  
    create_table "jambodoc_categories", force: :cascade do |t|
      t.string   "title"
      t.string   "desc"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "jambodocs", force: :cascade do |t|
      t.string   "title"
      t.text     "text"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "learningdesk_contacts", force: :cascade do |t|
      t.string   "name"
      t.string   "email"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "learningdesk_recipients", force: :cascade do |t|
      t.integer  "learningdesk_report_id"
      t.string   "mode"
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
      t.integer  "contact_id"
      t.index ["learningdesk_report_id"], name: "index_learningdesk_recipients_on_learningdesk_report_id", using: :btree
    end
  
    create_table "learningdesk_reports", force: :cascade do |t|
      t.string   "title"
      t.text     "report"
      t.integer  "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_learningdesk_reports_on_user_id", using: :btree
    end
  
    create_table "media", force: :cascade do |t|
      t.string   "title"
      t.string   "url"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "participant_roles", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
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
  
    create_table "socialusers", force: :cascade do |t|
      t.string   "provider"
      t.string   "uid"
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
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
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "user_id"
      t.string   "fullname"
      t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
    end
  
    create_table "users", force: :cascade do |t|
      t.string   "email",                  default: "", null: false
      t.string   "encrypted_password",     default: "", null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "role"
      t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    end
  
    add_foreign_key "eventosbahais", "users"
    add_foreign_key "itineraries", "participants"
    add_foreign_key "learningdesk_recipients", "learningdesk_reports"
    add_foreign_key "learningdesk_reports", "users"
    add_foreign_key "participants", "administrative_functions"
    add_foreign_key "participants", "eventosbahais"
    add_foreign_key "participants", "users"
    add_foreign_key "user_profiles", "users"
  end
end
