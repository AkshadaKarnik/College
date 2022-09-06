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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_124914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "college_id", null: false
    t.string "name"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_departments_on_college_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "college_id", null: false
    t.bigint "department_id", null: false
    t.string "name"
    t.string "enroll_no"
    t.date "clg_start_date"
    t.date "clg_end_date"
    t.string "gender"
    t.integer "age"
    t.string "contact"
    t.string "email"
    t.string "password"
    t.string "permanent_address"
    t.string "current_address"
    t.string "aadhar_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_students_on_college_id"
    t.index ["department_id"], name: "index_students_on_department_id"
  end

  add_foreign_key "departments", "colleges"
  add_foreign_key "students", "colleges"
  add_foreign_key "students", "departments"
end
