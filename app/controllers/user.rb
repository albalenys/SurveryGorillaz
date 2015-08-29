get '/users/new' do
  if request.xhr?
    erb :"/users/signup", layout: false
  else
    erb :"/users/signup"
  end
end

get '/users/login' do
  if request.xhr?
    erb :"/users/login", layout: false
  else
    erb :"/users/login"
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  if request.xhr?
    erb :"/users/profile", layout: false
  else
    erb :"/users/profile"
  end
end

post '/users/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  elsif user
    flash[:error] = "Your password was incorrect"
    redirect '/users/login'
  else
    flash[:error] = "Your email or password was incorrect"
    redirect '/users/login'
  end
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    p "error"
  end
end

delete '/users/:id' do
  session.clear
  redirect '/'
end

