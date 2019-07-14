class Quizes < ActiveRecord::Base
  belongs_to :teacher
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
end
