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

ActiveRecord::Schema.define(version: 2019_07_19_034151) do

  create_table "course_quizzes", force: :cascade do |t|
    t.integer "course_id"
    t.integer "quiz_id"
    t.index ["course_id"], name: "index_course_quizzes_on_course_id"
    t.index ["quiz_id"], name: "index_course_quizzes_on_quiz_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "teacher_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.string "ans_1"
    t.string "ans_2"
    t.string "ans_3"
    t.string "ans_4"
    t.string "correct_ans"
    t.string "question_type"
    t.integer "teacher_id"
    t.index ["teacher_id"], name: "index_questions_on_teacher_id"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.integer "quiz_id"
    t.integer "question_id"
    t.index ["question_id"], name: "index_quiz_questions_on_question_id"
    t.index ["quiz_id"], name: "index_quiz_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.integer "teacher_id"
    t.index ["teacher_id"], name: "index_quizzes_on_teacher_id"
  end

  create_table "student_courses", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_student_courses_on_course_id"
    t.index ["student_id"], name: "index_student_courses_on_student_id"
  end

  create_table "student_questions", force: :cascade do |t|
    t.integer "student_quiz_id"
    t.integer "question_id"
    t.string "student_answer"
    t.index ["question_id"], name: "index_student_questions_on_question_id"
    t.index ["student_quiz_id"], name: "index_student_questions_on_student_quiz_id"
  end

  create_table "student_quizzes", force: :cascade do |t|
    t.integer "student_id"
    t.integer "quiz_id"
    t.integer "course_quiz_id"
    t.integer "score"
    t.datetime "open_time"
    t.datetime "close_time"
    t.index ["course_quiz_id"], name: "index_student_quizzes_on_course_quiz_id"
    t.index ["quiz_id"], name: "index_student_quizzes_on_quiz_id"
    t.index ["student_id"], name: "index_student_quizzes_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
  end

end
