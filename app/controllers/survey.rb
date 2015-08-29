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

# delete '/surveys/:id' do
#   p params.to_s
# end

# post '/surveys' do
#   p params.to_s
# end

# put '/surveys/:id' do
#   p params.to_s
# end


post '/surveys' do
  binding.pry
  survey = Survey.new(title: params[:survey][:title], user_id: session[:user][:id])
  if survey.save
    binding.pry
    redirect "/surveys/#{survey.id}/questions/new"
  else
    erb :"/surveys/new"
  end
end

get 'surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @question = Question.new
  binding.pry
  erb :"/questions/new"
end
