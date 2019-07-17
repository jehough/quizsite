class CreateQuizQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_questions do |t|
      t.belongs_to :quiz, index: true
      t.belongs_to :question, index: true
    end
  end
end
