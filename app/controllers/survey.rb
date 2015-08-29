get '/surveys/:id/edit' do
  @survey = Survey.find_by(id: params[:id])
  erb :"/surveys/edit"
end

get '/surveys/new' do
  @survey = Survey.new
  if request.xhr?
    erb :"/surveys/new", layout: false
  else
    erb :"/surveys/new"
  end
end

get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  erb :"/surveys/show"
end

get '/surveys' do
  @surveys = Survey.all
  if request.xhr?
    erb :"/surveys/index", layout: false
  else
    erb :"/surveys/index"
  end
end

get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @question = Question.new
  erb :'/questions/new'
end

post '/surveys/:id/questions' do
  survey = Survey.find_by(id: params[:id])
  question = survey.questions.new(content: params[:question])
  choice1 = question.choices.new(content: params[:response1])
  choice2 = question.choices.new(content: params[:response2])
  choice3 = question.choices.new(content: params[:response3])
  choice4 = question.choices.new(content: params[:response4])
  if (question.save && choice1.save && choice2.save && choice3.save && choice4.save)
    redirect "/surveys/#{survey.id}/questions/new"
  else
    flash[:error] = @question.errors.full_messages.to_sentence
    redirect "/surveys/#{survey.id}/questions/new"
  end
end

post '/surveys' do
  survey = Survey.new(title: params[:survey][:title], user_id: session[:user_id])
  if survey.save
    redirect "/surveys/#{survey.id}/questions/new"
  else
    erb :"/surveys/new"
  end
end

delete '/surveys/:id' do
  Survey.find_by(id: params[:id]).destroy
  redirect "/surveys"
end

put '/surveys/:id' do
  p params.to_s
  # we need to do this
end

post '/surveys/:id/submit' do
  survey = Survey.find_by(id: params[:survey_id])
  survey.questions.each do |question|
    QuestionResponse.create(question_id: question.id, choice_id: params[:"#{question.id}"][:choice_id], user_id: session[:user_id], survey_id: params[:survey_id])
  end
  redirect "/"
  #change to redirect to thanks page once created
end


