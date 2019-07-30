require_relative "./concerns/slugifiable"
class Teacher < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :password, presence: true
  has_many :quizzes
  has_many :questions
  has_many :courses
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
