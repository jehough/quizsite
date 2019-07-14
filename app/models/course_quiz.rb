class CourseQuiz < ActiveRecord::Base
  belongs_to :course
  belongs_to :quiz
end
