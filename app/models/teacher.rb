class Teacher < ActiveRecord::Base
  has_secure_password
  has_many :quizes
  has_many :questions
  has_many :classes
end