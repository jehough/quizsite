require 'pry'
require 'date'

class StudentQuizController < ApplicationController

  get '/student/:slug/quiz/:id' do
    if Helper.is_student?(session)
      if (Helper.current_student(session) == Student.find_by_slug(params[:slug]))
        @student = Helper.current_student(session)
        @stquiz = StudentQuiz.find(params[:id])
        binding.pry
        if (@stquiz.score != nil)
          flash[:message] = "I'm sorry, you have already taken this quiz"
          erb :'/quiz/student/error'
        elsif (Time.now < @stquiz.open_time || Time.now > @stquiz.close_time)
          flash[:message] = "This quiz is not currently open"
          erb :'/quiz/student/error'
        else
          erb :'/quiz/student/show'
        end
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end

end
