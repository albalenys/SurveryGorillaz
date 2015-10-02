get '/' do
  @surveys = Survey.all
  if request.xhr?
    erb :"/index", layout: false
  else
    erb :"/index"
  end
end
