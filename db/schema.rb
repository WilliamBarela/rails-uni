# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_01_200034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faculty_members", comment: "FacultyMembers Table: all faculty member roles", force: :cascade do |t|
    t.string "current_title", comment: "Professor, Assistant Professor, Instructor, ..."
    t.text "auxiliary_roles", comment: "Chairship, Directorship, ..."
    t.text "objectives_statement", comment: "160 or less character long objectives/mission statement"
    t.text "research_interests_summary", comment: "paragraph(s) stating summary of research interests"
    t.date "role_start_date", comment: "date in which this faculty role was started"
    t.date "role_termination_date", comment: "date in which this faculty role ended"
    t.string "termination_reason", comment: "default: null, contract ended, fired, quit, promoted, ..."
    t.bigint "person_id", null: false, comment: "one person to possibly many faculty roles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_faculty_members_on_person_id"
  end

  create_table "graduate_advisorships", comment: "join table of faculty_members and graduate_students", force: :cascade do |t|
    t.boolean "primary_advisor?", comment: "true, false"
    t.date "advising_initiation", comment: "when advisory relationship commenced"
    t.date "advising_termination", comment: "when advisory relationship ended"
    t.bigint "faculty_member_id", null: false, comment: "faculty members may have many advisees"
    t.bigint "graduate_student_id", null: false, comment: "graduate students may have many advisors"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["faculty_member_id"], name: "index_graduate_advisorships_on_faculty_member_id"
    t.index ["graduate_student_id"], name: "index_graduate_advisorships_on_graduate_student_id"
  end

  create_table "graduate_students", comment: "GraduateStudents table for all graduate student roles", force: :cascade do |t|
    t.string "current_program", comment: "Biology, Microbiology, ..."
    t.string "degree_sought", comment: "PhD, Master, PSM, ..."
    t.string "auxiliary_roles", comment: "GA, RA, TA, ..."
    t.integer "expected_graduation_year", comment: "2020, 2021, ..."
    t.string "expected_graduation_semester", comment: "Spring, Fall, Summer"
    t.text "objectives_statement", comment: "160 or less character long objectives/mission statement"
    t.text "research_interests_summary", comment: "paragraph(s) stating summary of research interests"
    t.date "role_start_date", comment: "date in which graduate student's current_program role started"
    t.date "role_termination_date", comment: "date in which graduate student's currrent_program role finished"
    t.string "termination_reason", comment: "default: null; contract ended, fired, quit, ..."
    t.bigint "person_id", null: false, comment: "one person to possibly many graduate student roles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_graduate_students_on_person_id"
  end

  create_table "people", comment: "People Table: info for all members of the department (excluding role info)", force: :cascade do |t|
    t.string "honorific", comment: "person honorific: Mr., Miss, Ms., Mrs., Dr., ..."
    t.string "last_name", comment: "person surname"
    t.string "middle_name", comment: "person middle name (optional)"
    t.string "first_name", comment: "person given name"
    t.string "suffix", comment: "person suffix: I, II, Jr., Sr., ..."
    t.string "gender", comment: "person gender: female, male, non-binary"
    t.string "ttus_email", comment: "person TTU email username@ttu.edu, username@ttuhsc.edu"
    t.string "ttus_phone", comment: "person work phone"
    t.date "ttus_termination_date", comment: "date of dissociation from TTU"
    t.string "termination_reason", comment: "reason for termination from TTU"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "faculty_members", "people"
  add_foreign_key "graduate_advisorships", "faculty_members"
  add_foreign_key "graduate_advisorships", "graduate_students"
  add_foreign_key "graduate_students", "people"
end
