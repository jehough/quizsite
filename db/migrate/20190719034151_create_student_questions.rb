class CreateStudentQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :student_questions do |t|
      t.belongs_to :student_quiz, index: true
      t.belongs_to :question, index:true
      t.string :student_answer
    end
  end
end
