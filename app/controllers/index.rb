get '/' do
  @surveys = Survey.all
  erb :'/index'
end

# <ol>
#   <% @surveys.each do |survey| %>
#     <li><a href="/survery/"><%=survey.title %></a></li>
#   <% end %>
# </ol>
