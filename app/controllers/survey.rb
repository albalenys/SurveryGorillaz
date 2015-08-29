get '/surveys/:id/edit' do
  @survey = Survey.find_by(id: params[:id])
  erb :"/surveys/edit"
end

get '/surveys/new' do
  @survey = Survey.new
  erb :"/surveys/new"
end

get '/surveys/:id' do
  erb :"/surveys/show"
end

get '/surveys' do
  @surveys = Survey.all
  erb :"/surveys/index"
end

get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @question = Question.new
  erb :'/questions/new'
end

post '/surveys/:id/questions' do
  survey = Survey.find_by(id: params[:id])
  question = survey.questions.create(content: params[:users][:question])
  question.choices.create(content: params[:users][:response1])
  question.choices.create(content: params[:users][:response2])
  question.choices.create(content: params[:users][:response3])
  question.choices.create(content: params[:users][:response4])
  redirect "/surveys/#{survey.id}/questions/new"
end

post '/surveys' do
  survey = Survey.new(title: params[:survey][:title], user_id: session[:user][:id])
  if survey.save
    redirect "/surveys/#{survey.id}/questions/new"
  else
    erb :"/surveys/new"
  end
end

delete '/surveys/:id' do
  p params.to_s
end

put '/surveys/:id' do
  p params.to_s
end


