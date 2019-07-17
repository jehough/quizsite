require 'pry'

class TeacherCourseController < ApplicationController

  post "/teacher/:slug/course" do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
         @teacher = Helper.current_teacher(session)
         course = Course.create(:name => params[:course], :teacher_id => @teacher.id)
         @teacher.courses << course
         redirect "/teacher/#{@teacher.slug}/course/#{course.id}"
      else
        redirect '/'
      end
    else
        redirect '/'
    end
  end

  get "/teacher/:slug/course/:id/add_students" do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        @course = Course.find(params[:id])
        @students = Student.all
        erb :'course/teacher/add_students'
      else
        redirect '/'
      end
    else
        redirect '/'
    end
  end

  get "/teacher/:slug/course/:id" do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        @course = Course.find(params[:id])
        erb :'course/teacher/show'
      else
        redirect '/'
      end
    else
        redirect '/'
    end
  end

  post '/teacher/:slug/course/:id' do
    teacher = Helper.current_teacher(session)
    course = Course.find(params[:id])
    students = params[:students].map do |student_id|
      Student.find(student_id.to_i)
    end
    course.students = students
    redirect "/teacher/#{teacher.slug}/course/#{course.id}"
  end


end
