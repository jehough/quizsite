class StudentQuiz < ActiveRecord::Base
  belongs_to :student
  belongs_to :quiz
  belongs_to :course_quiz
  has_many :student_questions

  def save_student_answers(params)
    params["question_id"].each do |qid|
      question = Question.find(qid)
      StudentQuestion.create(:student_quiz => self.id, :question => question.id, :student_answer => params["student_answers"][qid])
    end
  end
end
