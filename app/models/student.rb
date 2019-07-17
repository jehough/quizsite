require_relative "./concerns/slugifiable"
class Student < ActiveRecord::Base
  has_secure_password
  has_many :student_courses
  has_many :courses, through: :student_courses
  has_many :teachers, through: :courses
  has_many :quizzes, through: :courses
  has_many :student_quizzes
  has_many :quizzes, through: :student_quizzes
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
