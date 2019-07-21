require 'pry'
require 'date'

class StudentQuizController < ApplicationController

  get '/student/:slug/quiz/:id' do
    if Helper.is_student?(session)
      if (Helper.current_student(session) == Student.find_by_slug(params[:slug]))
        @student = Helper.current_student(session)
        @stquiz = StudentQuiz.find(params[:id])
        if (@stquiz.score != nil)
          @stans = @stquiz.student_questions
          erb :'/quiz/student/complete'
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

  post '/student/:slug/quiz/:id' do
    @student = Student.find_by_slug(params[:slug])
    @stquiz = StudentQuiz.find(params[:id])
    @stquiz.save_student_answers(params)
    score = Grade.grade_quiz(params)
    @stquiz.score = score
    @stquiz.save

    redirect "/student/#{@student.slug}/quiz/#{@stquiz.id}"
  end



end
