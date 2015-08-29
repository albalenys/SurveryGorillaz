get '/' do
  @surveys = Survey.all
  if request.xhr?
    erb :"/surveys/index", layout: false
  else
    erb :"/surveys/index"
  end
end
