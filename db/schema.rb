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

ActiveRecord::Schema[7.0].define(version: 2022_09_05_091102) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anamneses", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "date"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_anamneses_on_patient_id"
  end

  create_table "cares", force: :cascade do |t|
    t.string "description"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultations", force: :cascade do |t|
    t.bigint "tour_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "end_date"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "validated", default: false
    t.index ["patient_id"], name: "index_consultations_on_patient_id"
    t.index ["tour_id"], name: "index_consultations_on_tour_id"
  end

  create_table "patient_cares", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "care_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["care_id"], name: "index_patient_cares_on_care_id"
    t.index ["patient_id"], name: "index_patient_cares_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.float "lat"
    t.float "long"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_pic"
    t.string "gender"
  end

  create_table "remarks", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.integer "tag"
    t.string "description"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_remarks_on_patient_id"
  end

  create_table "tours", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tours_on_user_id"
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
    t.string "profile_pic"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "validated_cares", force: :cascade do |t|
    t.bigint "consultation_id", null: false
    t.bigint "care_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "done", default: false
    t.index ["care_id"], name: "index_validated_cares_on_care_id"
    t.index ["consultation_id"], name: "index_validated_cares_on_consultation_id"
  end

  add_foreign_key "anamneses", "patients"
  add_foreign_key "consultations", "patients"
  add_foreign_key "consultations", "tours"
  add_foreign_key "patient_cares", "cares"
  add_foreign_key "patient_cares", "patients"
  add_foreign_key "remarks", "patients"
  add_foreign_key "tours", "users"
  add_foreign_key "validated_cares", "cares"
  add_foreign_key "validated_cares", "consultations"
end
