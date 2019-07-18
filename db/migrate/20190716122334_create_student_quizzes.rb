class CreateStudentQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :student_quizzes do |t|
      t.belongs_to :student, index: true
      t.belongs_to :quiz, index: true
      t.belongs_to :course_quiz, index: true
      t.integer :score
      t.datetime :open_time
      t.datetime :close_time
    end
  end
end
