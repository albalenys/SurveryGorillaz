get '/' do
  @surveys = Survey.all
  if request.xhr?
    erb :"shared/index", layout: false
  else
    erb :"shared/index"
  end
end
