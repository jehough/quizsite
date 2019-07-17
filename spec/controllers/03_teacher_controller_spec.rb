require 'spec_helper'
require 'pry'

describe "Create Teacher" do

  it "shows a page with name and password options" do
    get "/teacher/new"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Password:")
    expect(last_response.body).to include("Username:")
  end

  it "creates a new teacher when submitted" do
      visit "teacher/new"
      fill_in "Name", with: "Mr. Awesome"
      fill_in "Password", with: "password"
      click_on "Create"

      expect(body).to include("Welcome, Mr. Awesome!")
  end

  it "will not allow a username to be repeated" do
    Teacher.create(:name => "don't repeat", :password => "password")
    visit "teacher/new"
    fill_in "Name", with: "don't repeat"
    fill_in "Password", with: "password"
    click_on "Create"

    expect(body).to include("This username is taken")
  end

end

describe "Teacher Log-in" do

  it "has space for username and password" do
    get "/teacher/login"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Password:")
    expect(last_response.body).to include("Username:")
  end

  it "logs in an existing user" do
    Teacher.create(:name => "Mr. Awesome", :password => "password")
    visit "teacher/login"
    fill_in "Name", with: "Mr. Awesome"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(body).to include("Welcome, Mr. Awesome!")
  end

  it "will not let student log into teacher" do
    Student.create(:name => "Sam", :password => "jackinthebox")
    visit "teacher/login"
    fill_in "Name", with: "Sam"
    fill_in "Password", with: "jackinthebox"
    click_on "Login"

    expect(body).to include("Username/Password not found!")
  end

  it "will not let a non-user log-in" do
    visit "teacher/login"
    fill_in "Name", with: "Joe"
    fill_in "Password", with: "notateacher"
    click_on "Login"

    expect(body).to include("Username/Password not found!")
  end
end
