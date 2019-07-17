require 'pry'

class QuestionController < ApplicationController

  get '/teacher/:slug/question' do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        @questions = @teacher.questions
        erb :'questions/index'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end

  get '/teacher/:slug/question/new' do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        @questions = @teacher.questions
        erb :'questions/new'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end

  post '/teacher/:slug/question' do
    puts params
  end

  get '/teacher/:slug/question/:id/edit' do

  end

  get '/teacher/:slug/question/:id' do

  end

  patch '/teacher/:slug/question/:id' do

  end

end
