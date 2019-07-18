require 'spec_helper'
require 'pry'

describe "Student Quiz Controller" do
  before do
    @student = Student.create(:name => "Sally", :password => "password")
    @student2 = Student.create(:name => "Joe", :password => "password")
    @quiz = Quiz.create(:name => "first quiz")
    course = Course.create(:name => "Chemistry")
    course_quiz = CourseQuiz.create(:course_id => course.id, :quiz_id => @quiz.id)
    @stquiz1 = StudentQuiz.create(:student_id => @student.id, :quiz_id => @quiz.id, :course_quiz_id => course_quiz.id, :open_time => Time.now + 3600, :close_time => (Time.now + 7200))
    @stquiz2 = StudentQuiz.create(:student_id => @student.id, :quiz_id => @quiz.id, :course_quiz_id => course_quiz.id, :open_time => Time.now - 3600, :close_time => (Time.now + 3600))

    params = {:name => "Sally", :password => "password"}
    post "/student/login", params
  end

  it "will not access the quiz if not in right timeframe" do
    get "/student/#{@student.slug}/quiz/#{@stquiz1.id}"
    expect(last_response.body).to include("not currently open")
  end

  it "will not access the quiz if not the right student" do
    get "/student/#{@student2.slug}/quiz/#{@stquiz2.id}"
    expect(last_response.body).to include("")
  end

  it "will not allow a student to take the quiz again" do
    @stquiz2.score = 90
    get "/student/#{@student.slug}/quiz/#{@stquiz2.id}"
    expect(last_response.body).to include("already taken")
  end

end
