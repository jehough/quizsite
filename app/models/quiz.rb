class Quiz < ActiveRecord::Base
  belongs_to :teacher
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
  has_many :course_quizzes
  has_many :courses, through: :course_quizzes
end
