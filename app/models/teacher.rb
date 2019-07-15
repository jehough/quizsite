class Teacher < ActiveRecord::Base
  has_secure_password
  has_many :quizzes
  has_many :questions
  has_many :courses
end
