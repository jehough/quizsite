require 'pry'
require 'rack-flash'

class TeacherController < ApplicationController
  use Rack::Flash


  get '/student/new' do
    erb :'student/new'
  end

  post '/student' do
    if (params[:name] == "" || params[:password] == "")
      flash[:message] = "Please fill in all fields"
      redirect '/student/new'
    elsif !!(Student.find_by(:name => params[:name]))
      flash[:message] = "This username is taken."
      redirect '/student/new'
    else
      student = Student.create(:name => params[:name], :password => params[:password])
      session[:student_id] = student.id
      redirect "/student/#{student.slug}"
    end
  end

  get '/teacher/login' do
    if Helper.is_teacher?(session)
      teacher = Helper.current_teacher(session)
      redirect "teacher/#{teacher.slug}"
    elsif Helper.is_student?(session)
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
      redirect "/teacher/#{teacher.slug}"
    else
      flash[:message] = "Username/Password not found!"
      redirect '/teacher/login'
    end
  end

  post '/teacher/logout' do
    session.clear
    redirect '/'
  end

  get '/teacher/:slug' do
    if Helper.is_teacher?(session)
      if (Teacher.find_by_slug(params[:slug]) == Helper.current_teacher(session))
        @teacher = Helper.current_teacher(session)
        erb :'teacher/show'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end



end
