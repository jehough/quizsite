require 'spec_helper'
require 'pry'

describe "Student" do

  before do
    @teacher = Teacher.create(:name => "Mr. Awesome", :password => "password")
    @quiz = Quiz.create(:name => "First Day Quiz", :teacher_id => @teacher.id)
    @question = Question.create(:question => "The answer is 1", :ans_1 => "1", :ans_2 => "2", :ans_3 => "3", :correct_ans => "1", :teacher_id => @teacher.id)
    @class = Course.create(:name => "Science", :teacher_id => @teacher.id)
    @student = Student.create(:name => "Sam", :password => "password")
    course_quiz = CourseQuiz.create(:course_id => @class.id, :quiz_id => @quiz.id)
    student_course = StudentCourse.create(:course_id => @class.id, :student_id => @student.id)
  end


  it "can be initialized" do
    expect(@student).to be_an_instance_of(Student)
  end

  it "has many quizzes" do
    expect(@student.courses[0].quizzes.count).to eq(1)
  end


  it "has many classes" do
    expect(@student.courses.count).to eq(1)
  end

  it "has many teachers through classes" do

    expect(@teacher.courses[0].teacher).to eq(@teacher)
  end

  it "has secure password" do
    expect(@teacher.authenticate("dog")).to eq(false)

    expect(@teacher.authenticate("password")).to eq(@teacher)
  end

end
