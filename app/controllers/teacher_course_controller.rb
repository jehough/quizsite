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

  get "/teacher/:slug/course/:id/add_students" do

  end

end
