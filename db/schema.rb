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

ActiveRecord::Schema[7.0].define(version: 2024_07_30_144401) do
  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_programs", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_student_programs_on_program_id"
    t.index ["student_id"], name: "index_student_programs_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "fullname"
    t.string "gender"
    t.date "date"
    t.string "contact"
    t.string "church"
    t.string "email"
    t.text "responsibility"
    t.text "description"
    t.text "motivation"
    t.text "challenges"
    t.string "availability"
    t.text "commitments"
    t.text "achievements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.string "contact"
    t.string "area_of_interest"
    t.string "church"
    t.text "message"
    t.boolean "accepted_terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "student_programs", "programs"
  add_foreign_key "student_programs", "students"
end
