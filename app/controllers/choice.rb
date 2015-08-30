get '/choices/new' do
  @choice = Choice.new
  if request.xhr?
    erb :'/surveys/_choice', layout: false
  else
    erb :'/choices/new'
  end
end

post '/choices' do
  puts "~" * 80
  p params.to_s
end
