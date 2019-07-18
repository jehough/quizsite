require 'date'
class CourseQuiz < ActiveRecord::Base
  belongs_to :course
  belongs_to :quiz
  has_many :student_quizzes

  def self.add_quiz_to_course(params)
    start = DateTime.parse(params[:start_time]).utc
    finish = DateTime.parse(params[:end_time]).utc
    course = Course.find(params[:id])
    quiz = Quiz.find(params[:quiz])
    course_quiz =self.create(:course_id => course.id, :quiz_id => quiz.id)
    course.students.each do |student|
      StudentQuiz.create(:student_id => student.id, :quiz_id => quiz.id, :course_quiz_id => course_quiz.id, :open_time => start, :close_time => finish)
    end
  end
end
