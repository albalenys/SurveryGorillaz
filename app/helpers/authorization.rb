def logged_in?
  session[:user_id]
end

def current_user
  User.find_by(id: session[:user_id])
end

def redirect_home_unless_logged_in
  flash[:not_logged_in] = "You must be logged in to do that!"
  redirect '/' unless logged_in?
end
