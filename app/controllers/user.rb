get '/users/new' do
  erb :"/users/signup"
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user] = user
    redirect '/'
  else
    error
  end
end

post '/users/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user] = user
    redirect '/'
  else
    error
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :"/users/profile"
end
