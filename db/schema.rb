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

ActiveRecord::Schema.define(version: 2015_02_27_075054) do

  create_table "activities", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "act_type"
    t.integer "user_id"
    t.integer "cource_id"
    t.integer "subject_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cource_id"], name: "index_activities_on_cource_id"
    t.index ["subject_id"], name: "index_activities_on_subject_id"
    t.index ["task_id"], name: "index_activities_on_task_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "courses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_subjects", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "course_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courses_subjects_on_course_id"
    t.index ["subject_id"], name: "index_courses_subjects_on_subject_id"
  end

  create_table "enrollment_subjects", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subject_id"
    t.integer "course_id"
    t.integer "courses_subject_id"
    t.integer "enrollment_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollment_subjects_on_course_id"
    t.index ["courses_subject_id"], name: "index_enrollment_subjects_on_courses_subject_id"
    t.index ["enrollment_id"], name: "index_enrollment_subjects_on_enrollment_id"
    t.index ["subject_id"], name: "index_enrollment_subjects_on_subject_id"
    t.index ["user_id"], name: "index_enrollment_subjects_on_user_id"
  end

  create_table "enrollment_tasks", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.integer "subject_id"
    t.integer "enrollment_subject_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enrollment_subject_id"], name: "index_enrollment_tasks_on_enrollment_subject_id"
    t.index ["subject_id"], name: "index_enrollment_tasks_on_subject_id"
    t.index ["task_id"], name: "index_enrollment_tasks_on_task_id"
    t.index ["user_id"], name: "index_enrollment_tasks_on_user_id"
  end

  create_table "enrollments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "subjects", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.integer "enrollment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enrollment_id"], name: "index_subjects_on_enrollment_id"
    t.index ["user_id"], name: "index_subjects_on_user_id"
  end

  create_table "tasks", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "subject_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_tasks_on_subject_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "reset_digest"
    t.string "activation_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role"], name: "index_users_on_role"
  end

end
