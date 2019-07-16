class CreateStudentQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :student_quizzes do |t|
      t.integer :student_id
      t.integer :quiz_id
      t.integer :score
      t.datetime :open_time
      t.datetime :close_time
    end
  end
end
