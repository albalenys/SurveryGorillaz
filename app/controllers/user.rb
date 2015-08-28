get '/users/new' do
  erb :"/users/signup"
end

post '/users' do
  user = User.new(params[:user])

  if user.save
    redirect '/'
  else
    error
  end
end
