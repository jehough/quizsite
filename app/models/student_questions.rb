class StudentQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :student_quiz
end
