class StudentQuiz < ActiveRecord::Base
  belongs_to :student
  belongs_to :quiz
  belongs_to :course_quiz
  has_many :student_questions
end
