class Questions < ActiveRecord::Base
belongs_to :teacher
has_many :quiz_questions
has_many :quizes, through: :quiz_questions
end
