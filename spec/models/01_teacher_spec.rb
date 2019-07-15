require 'spec_helper'
require 'pry'

describe "Teacher" do

  before do
    @teacher = Teacher.create(:name => "Mr. Awesome", :password => "password")
    @quiz = Quiz.create(:name => "First Day Quiz", :teacher_id => @teacher.id)
    @question = Question.create(:question => "The answer is 1", :ans_1 => "1", :ans_2 => "2", :ans_3 => "3", :correct_ans => "1", :teacher_id => @teacher.id)
    @class = Course.create(:name => "Science", :teacher_id => @teacher.id)
    @student = Student.create(:name => "Sam", :password => "password")
    student_course = StudentCourse.create(:course_id => @class.id, :student_id => @student.id)
  end


  it "can be initialized" do
    expect (@teacher).to_be_an_instance_of(Teacher)
  end

  it "has many quizzes" do
    expect (@teacher.quizes.count).to_eq(1)
  end

  it "has many questions" do
    expect (@teacher.questions.count).to_eq(1)
  end


  it "has many classes" do
    expect (@teacher.classes.count).to_eq(1)
  end

  it "has many students" do
    expect (@teacher.classes.students.count).to_eq(1)
  end

  it "has secure password" do
    expect (@teacher.authenticate("dog")).to_eq(false)

    expect (@teacher.authenticate("password")).to_eq(@teacher)
  end

end
