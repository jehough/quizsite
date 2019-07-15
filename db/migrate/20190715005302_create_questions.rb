class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :ans_1
      t.string :ans_2
      t.string :ans_3
      t.string :ans_4
      t.string :correct_ans
      t.string :question_type
      t.integer :teacher_id
    end
  end
end
