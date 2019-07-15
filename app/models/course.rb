class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :course_quizzes
  has_many :quizzes, through: :course_quizzes
  has_many :student_courses
  has_many :students, through: :student_courses
end
