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

ActiveRecord::Schema[7.1].define(version: 2023_12_18_180001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "course"
    t.string "purpose"
    t.bigint "student_id"
    t.date "start_date"
    t.date "end_date"
    t.bigint "training_director_id"
    t.bigint "training_instructor_id"
    t.bigint "external_facilitator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_facilitator_id"], name: "index_certificates_on_external_facilitator_id"
    t.index ["student_id"], name: "index_certificates_on_student_id"
    t.index ["training_director_id"], name: "index_certificates_on_training_director_id"
    t.index ["training_instructor_id"], name: "index_certificates_on_training_instructor_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "unique_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "certificate_id", null: false
    t.index ["certificate_id"], name: "index_students_on_certificate_id"
  end

  create_table "trainingpersonnels", force: :cascade do |t|
    t.string "name"
    t.string "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "certificates", "students"
  add_foreign_key "certificates", "trainingpersonnels", column: "external_facilitator_id"
  add_foreign_key "certificates", "trainingpersonnels", column: "training_director_id"
  add_foreign_key "certificates", "trainingpersonnels", column: "training_instructor_id"
  add_foreign_key "students", "certificates"
end
