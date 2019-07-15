class CreateCourseQuizes < ActiveRecord::Migration[5.2]
  def change
    create_table :course_quizes do |t|
      t.integer :course_id
      t.integer :quiz_id
    end
  end
end
