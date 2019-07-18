require 'pry'
require 'rack-flash'

class StudentCourseController < ApplicationController

  get '/student/:slug/course/:id' do
    if Helper.is_student?(session)
      if (Helper.current_student(session) == Student.find_by_slug(params[:slug]))
        @student = Helper.current_student(session)
        @course = Course.find(params[:id])
        @studquiz = @student.student_quizzes
        @quizzes = @studquiz.find_all{|obj| obj.course_quiz.course == @course}
        erb :'course/student/show'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end


end
