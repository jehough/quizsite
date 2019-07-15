class CreateQuizes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizes do |t|
      t.string :name
      t.integer :teacher_id
    end
  end
end
