class CourseQuiz < ActiveRecord::Base
  belongs_to :course
  belongs_to :quiz
  has_many :student_quizzes
end
