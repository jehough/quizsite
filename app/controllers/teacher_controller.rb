require 'pry'
require 'rack-flash'

class TeacherController < ApplicationController
  use Rack::Flash

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
      flash[:message] = "This username is taken."
      redirect '/teacher/new'
    else
      teacher = Teacher.create(:name => params[:name], :password => params[:password])
      session[:teacher_id] = teacher.id
      redirect '/teacher'
    end
  end

  get '/teacher/login' do
    if Helper.is_teacher?
      redirect '/teacher'
    elsif Helper.is_student?
      flash[:message] = "Students may not log in as teachers"
      redirect '/'
    else
      erb :'teacher/login'
    end
  end

  post '/teacher/login' do
    teacher = Teacher.find_by(:name =>params[:name])
    if teacher && teacher.authenticate(params[:password])
      session[:teacher_id]= teacher.id
      redirect '/teacher'
    else
      flash[:message] = "Username/Password not found!"
      redirect '/teacher/login'
    end
  end
end
