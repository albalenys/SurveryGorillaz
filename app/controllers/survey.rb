get '/surveys/:id/edit' do
  @survey = Survey.find_by(id: params[:id])
  erb :"/surveys/edit"
end

get '/surveys/new' do
  @survey = Survey.new
  erb :"/surveys/new"
end

get '/surveys/:id' do
  erb :"/surveys/show"
end

get '/surveys' do
  @surveys = Survey.all
  erb :"/surveys/index"
end

get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @question = Question.new
  erb :'/questions/new'
end

post '/surveys/:id/questions' do
  survey = Survey.find_by(id: params[:id])
  question = survey.questions.create(content: params[:users][:question])
  question.choices.create(content: params[:users][:response1])
  question.choices.create(content: params[:users][:response2])
  question.choices.create(content: params[:users][:response3])
  question.choices.create(content: params[:users][:response4])
  redirect "/surveys/#{survey.id}/questions/new"
end

post '/surveys' do
  survey = Survey.new(title: params[:survey][:title], user_id: session[:user][:id])
  if survey.save
    redirect "/surveys/#{survey.id}/questions/new"
  else
    erb :"/surveys/new"
  end
end

delete '/surveys/:id' do
  p params.to_s
end

put '/surveys/:id' do
  p params.to_s
end




# put '/decks/:id' do
#   @deck = Deck.find_by(id: params[:id])
#   @deck.name = params[:deck][:name]
#   @cards = @deck.cards
#   @cards.each_with_index do |card, i|
#     card.question = params[:card]["#{i}"][:question]
#     card.answer = params[:card]["#{i}"][:answer]
#     unless card.save
#       flash[:errors] = card.errors.full_messages
#       redirect "/users/decks/#{@deck.id}/edit"
#     end
#   end
#   if @deck.save
#     redirect "/users/#{current_user.id}/profile"
#   else
#     flash[:errors] = @deck.errors.full_messages
#     redirect "/users/decks/#{@deck.id}/edit"
#   end
# end

# <div class="container">
#   <h1 class="title">Edit '<%= @deck.name %>'</h1>
#   <% if flash[:errors] %>
#     <% flash[:errors].each do |error| %>
#       <p class="error-message"><%=error%></p>
#     <% end %>
#   <%end%>
#   <form action="/decks/<%=@deck.id%>" method="POST">
#     <input type="hidden" name="_method" value="PUT" />
#     <p><label for="name">Name:</label>
#     <input id="name" type="text" name="deck[name]" value="<%= @deck.name %>"/>
#     <% @cards.each_with_index do |card, i| %>
#       <p><label for="question">Question:</label>
#       <input id="question" type="text" name="card[<%=i%>][question]" value="<%= card.question %>"/></p>
#       <p><label for="answer">Answer:</label>
#       <input id="answer" type="text" name="card[<%=i%>][answer]" value="<%= card.answer %>"/></p>
#     <% end %>
#     <input type="submit" value="Update"/></p>
#   </form>

#   <form class="delete" action="/decks/<%=@deck.id%>" method="POST">
#     <input type="hidden" name="_method" value="DELETE" />
#     <input class="delete-button" type="button" value="Delete Deck" /></p>
#   </form>
# </div>

