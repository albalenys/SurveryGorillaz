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

get '/users/:id/edit' do
  erb :"users/edit"
end

put '/users/:id' do
  current_user.update(img_src: params[:user][:img_src])
  current_user.update(first_name: params[:user][:first_name])
  current_user.update(last_name: params[:user][:last_name])
  current_user.update(city: params[:user][:city])
  current_user.update(country: params[:user][:country])
  current_user.update(email: params[:user][:email])
  current_user.update(password: params[:user][:password])
  if current_user.save
    redirect "/users/#{current_user.id}"
  else
    error
  end
end

