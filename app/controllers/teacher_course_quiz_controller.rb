require 'pry'

class TeacherCourseQuizController < ApplicationController

  get "/teacher/:slug/course/:id/quiz" do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        @course = Course.find(params[:id])
        @quizzes = @teacher.quizzes
        erb :'course/teacher/add_quiz'
      else
        redirect '/'
      end
    else
        redirect '/'
    end
  end

  post "/teacher/:slug/course/:id/quiz" do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        @course = Course.find(params[:id])
        CourseQuiz.add_quiz_to_course(params)
        redirect "/teacher/#{@teacher.slug}/course/#{@course.id}"
      else
        redirect '/'
      end
    else
        redirect '/'
    end
  end

end
