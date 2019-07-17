require 'spec_helper'
require 'pry'

describe "Create Student" do

  it "shows a page with name and password options" do
    get "/student/new"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Password:")
    expect(last_response.body).to include("Username:")
  end

  it "creates a new student when submitted" do
      visit "student/new"
      fill_in "Name", with: "Mr. Awesome"
      fill_in "Password", with: "password"
      click_on "Create"

      expect(body).to include("Mr. Awesome")
  end

  it "will not allow a username to be repeated" do
    Student.create(:name => "don't repeat", :password => "password")
    visit "student/new"
    fill_in "Name", with: "don't repeat"
    fill_in "Password", with: "password"
    click_on "Create"

    expect(body).to include("This username is taken")
  end

end

describe "Student Log-in" do

  it "has space for username and password" do
    get "/student/login"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Password:")
    expect(last_response.body).to include("Username:")
  end

  it "logs in an existing user" do
    Student.create(:name => "Mr. Awesome", :password => "password")
    visit "student/login"
    fill_in "Name", with: "Mr. Awesome"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(body).to include("Welcome, Mr. Awesome!")
  end


  it "will not let a non-user log-in" do
    visit "student/login"
    fill_in "Name", with: "Joe"
    fill_in "Password", with: "notateacher"
    click_on "Login"

    expect(body).to include("Username/Password not found!")
  end
end

describe "student show page" do
  before do
    @teacher = Teacher.create(:name => "Teacherdude", :password => "password")
    @student2 = Student.create(:name => "otherteach", :password => "other")
    @student = Student.create(:name => "Sally", :password => "student")
  end


  it "has a list of courses" do
    params = {:name => "Sally", :password => "student"}

    post '/student/login', params
    course = Course.create(:name => "Chemistry", :teacher_id => @teacher.id)
    StudentCourse.create(:course_id => course.id, :student_id => @student.id)
    course.students << @student
    @student.courses << course
    get "/student/#{@student.slug}"

    expect(last_response.body).to include("Chemistry")
  end


end
