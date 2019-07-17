require 'pry'
class TeacherController < ApplicationController

  get '/teacher' do
    @teacher = Teacher.find(session[:teacher_id])
    erb :'teacher/index'
  end

  get '/teacher/new' do
    erb :'teacher/new'
  end

  post '/teacher' do
    if (params[:name] == "" || params[:password] == "")
      redirect '/signup'
    elsif !!(Teacher.find_by(:name => params[:name]))
      redirect '/signup'
    else
      teacher = Teacher.create(:name => params[:name], :password =>[:password])
      session[:teacher_id] = teacher
      redirect '/teacher'
    end
  end

end
