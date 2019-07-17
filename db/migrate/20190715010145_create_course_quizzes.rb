class CreateCourseQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :course_quizzes do |t|
      t.belongs_to :course, index: true
      t.belongs_to :quiz, index:true
    end
  end
end
