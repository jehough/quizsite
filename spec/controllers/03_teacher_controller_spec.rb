require 'spec_helper'
require 'pry'

describe "Create Teacher" do

  it "shows a page with name and password options" do
    visit "teacher/create"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Password:")
    expect(last_response.body).to include("Username:")
  end



  it "creates a new teacher when submitted" do
      visit "teacher/create"
      fill_in "Name", with: "Mr. Awesome"
      fill_in "Password", with: "password"
      click_on "Create"

      expect(body).to include("Welcome, Mr. Awesome!")
  end

  it "will not allow a username to be repeated" do
    Teacher.create(:name => "don't repeat", :password => "password")
    visit "teacher/create"
    fill_in "Name", with: "don't repeat"
    fill_in "Password", with: "password"
    click_on "Create"

    expect(body).to include("This username is taken")
  end

end
