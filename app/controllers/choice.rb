get '/choices/new' do
  @choice = Choice.new
  if request.xhr?
    erb :'/surveys/_choice', layout: false
  else
    erb :'/choices/new'
  end
end

