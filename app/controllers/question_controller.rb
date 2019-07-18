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
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        question = Question.create(params[:question])
        question.teacher = @teacher
        question.save
        redirect "/teacher/#{@teacher.slug}/question"
      else
        redirect '/'
      end
    else
      redirect'/'
    end
  end

  get '/teacher/:slug/question/:id/edit' do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        @question = Question.find(params[:id])
        erb :'/questions/edit'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end

  get '/teacher/:slug/question/:id' do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        @question = Question.find(params[:id])
        erb :'/questions/show'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end

  patch '/teacher/:slug/question/:id' do

  end

end
