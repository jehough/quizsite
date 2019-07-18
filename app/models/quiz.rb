class Quiz < ActiveRecord::Base
  belongs_to :teacher
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
  has_many :course_quizzes
  has_many :courses, through: :course_quizzes
  has_many :student_quizzes
  has_many :students, through: :student_quizzes


  def answer_key
    self.questions.map do |question|
      question.correct_ans
    end
  end
end
