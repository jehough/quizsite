class StudentQuiz < ActiveRecord::Base
  belongs_to :student
  belongs_to :quiz
end
