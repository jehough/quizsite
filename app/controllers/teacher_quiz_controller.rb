class TeacherQuizController < ApplicationController


  post '/teacher/:slug/quiz' do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        quiz = Quiz.create(:name => params[:name], :teacher_id => @teacher.id)
        redirect "/teacher/#{@teacher.slug}/quiz/#{quiz.id}"
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end

  get '/teacher/:slug/quiz/' do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        erb :'quiz/teacher/index'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end

  get '/teacher/:slug/quiz/:id/edit' do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        @quiz = Quiz.find(params[:id])
        @questions = Question.all
        erb :'quiz/teacher/edit'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end

  get '/teacher/:slug/quiz/:id' do
    if Helper.is_teacher?(session)
      if (Helper.current_teacher(session) == Teacher.find_by_slug(params[:slug]))
        @teacher = Helper.current_teacher(session)
        @quiz = Quiz.find(params[:id])
        erb :'quiz/teacher/show'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end

  delete '/teacher/:slug/quiz/:id' do
    teacher = Helper.current_teacher(session)
    quiz = Quiz.find(params[:id])
    quiz.destroy
    redirect "/teacher/#{teacher.slug}"
  end

end
