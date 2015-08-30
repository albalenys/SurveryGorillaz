get '/choices/new' do
  @choice = Choice.new
  if request.xhr?
    erb :'/surveys/_choice', layout: false
  else
    erb :'/choices/new'
  end
end

post '/choices' do
  if request.xhr?
    puts "value"
    p params[:data]["0"][:value]
    puts "question"
    p params[:question]
  end
end
