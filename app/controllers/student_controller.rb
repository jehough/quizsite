require 'pry'
require 'rack-flash'

class StudentController < ApplicationController
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

  get '/student/login' do
    if Helper.is_student?(session)
      student = Helper.current_student(session)
      redirect "/student/#{student.slug}"
    elsif Helper.is_teacher?(session)
      teacher = Helper.current_teacher(session)
      redirect "/teacher/#{teacher.slug}"
    else
      erb :'student/login'
    end
  end

  post '/student/login' do
    student = Student.find_by(:name =>params[:name])
    if student && student.authenticate(params[:password])
      session[:student_id]= student.id
      redirect "/student/#{student.slug}"
    else
      flash[:message] = "Username/Password not found!"
      redirect '/student/login'
    end
  end

  post '/student/logout' do
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
