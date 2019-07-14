class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :course_quizzes
  has_many :quizes, through: :course_quizzes
  has_many :student_courses
  has_many :sudents, through: :student_courses
end