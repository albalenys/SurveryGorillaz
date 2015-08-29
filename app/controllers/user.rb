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

get '/users/login' do
  erb :"/users/login"
end

post '/users/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user
    redirect '/'
  else
    error
  end
end

delete '/users/:id' do
  session.clear
  redirect '/'
end
