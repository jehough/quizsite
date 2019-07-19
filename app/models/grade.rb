class Grade
  attr_reader :answer_key
  def self.grade_quiz(params)
    graded_array = get_graded_array(params)
    score(graded_array)
  end

  def self.get_graded_array(params)
    graded_array = params["question_id"].map do |qid|
      question = Question.find(qid)
      if question.correct_ans == params["student_answers"][qid]
        "correct"
      else
        "incorrect"
      end
    end
    graded_array
  end

  def self.score(array)
    num_correct = array.count("correct")
    num_total = array.count
    score = (num_correct * 100 / num_total)
  end
end
