get '/questions/new' do
  @question = Question.new
  if request.xhr?
    erb :'/surveys/_question', layout: false
  else
    erb :'/questions/new'
  end
end

post '/questions' do
  puts "+" * 80
  p params.to_s
end
