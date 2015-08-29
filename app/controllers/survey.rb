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

delete '/surveys/:id' do
  p params.to_s
end

post '/surveys' do
  p params.to_s
end

put '/surveys/:id' do
  p params.to_s
end
