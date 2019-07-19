class Question < ActiveRecord::Base
belongs_to :teacher
has_many :quiz_questions
has_many :quizzes, through: :quiz_questions
has_many :student_questions
end
