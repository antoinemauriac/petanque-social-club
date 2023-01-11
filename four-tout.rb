# class LeaguesController < ApplicationController

#   def index
#     @user = current_user
#     @leagues = @user.leagues
#   end

#   def show
#     @league = League.find(params[:id])
#     @games = @league.games
#     @teams_sorted = @league.teams.sort_by { |team| [-team.number_of_wins, -(team.points_for - team.points_against)] }

#     return unless @league.status == true

#     @first_winner = Team.find(@league.league_winner).users.first
#     @second_winner = Team.find(@league.league_winner).users.last
#   end

#   def new
#     @league = League.new
#     @users = []
#     @users.push(current_user)
#     current_user.friends.each do |friend|
#       @users.push(friend)
#     end
#   end

#   def create
#     @league = League.create!(league_params)
#     @selected_users = params[:user]
#     @selected_friends = []
#     @selected_users.keys.each do |f|
#       @selected_friends << SelectedUser.create(league: @league, user_id: User.find(f).id)
#     end

#     if params[:commit] == "LAISSE LE HASARD FAIRE"
#       @teams_all = []
#       @users = @selected_friends.shuffle().each_slice(2).to_a
#       @users.each do |two_user|
#         @team = Team.new(league: @league)
#         @team.save!
#         # this associate users and team to team user

#         two_user.each do |selected|
#           user = User.find(selected.user_id)
#           TeamUser.create!(user: user, team: @team)
#         end

#         if @teams_all.any?

#           @teams_all.each do |team|
#             @game = Game.create!(league: @league)
#             GameTeam.create!(team: team, game: @game)
#             GameTeam.create!(team: @team, game: @game)
#           end

#         end
#         @teams_all << @team

#       end
#         redirect_to league_path(@league)
#     else
#       redirect_to new_league_team_user_path(@league)
#     end
#   end

#   # def add_players
#   #   @league = League.find(params[:league_id])

#   # end

#   private

#   def league_params
#     params.require(:league).permit(:league_id, :name, :status, :league_winner, :admin_user, :rand)
#   end
# end


# <h2 class="flexy light-blue-bar">CRÉATION DE LIGUE</h2>
# <div class="flexy container-create">
#   <h4 class="title-create" style="text-align:center;margin-top:10px;">CHOISIS UN NOM</h4>
#   <div class="form-wrapper">
#   <%= form_with model: [@league] do |form| %>
#     <%= form.text_area :name, class: "text-create" %>

#   <h4 class="title-create">SÉLECTIONNE DES COLLÈGUES</h4>

#   <div class="flexy-create">
#     <% @users.each do |user|  %>
#       <div class="select-player"  data-controller="selection" data-selection-target="player">
#         <% if user.photo.attached? %>
#           <%= cl_image_tag user.photo.key, class: "avatar-selection" %>
#         <% else %>
#           <%= image_tag "bobby.png", class: "avatar-selection"%>
#         <% end %>
#         <label class="username-create" data-action="click->selection#background" for="<%= user.id %>"><%= user.username.upcase %></label>
#         <input type="checkbox" class="d-none" name="user[<%= user.id%>]" id="<%= user.id%>" value=<%= user%> />
#       </div>
#     <% end %>
#   </div>

#       <%= form.submit "CHOISIS LES DOUBLETTES", class: "btn-create-team" %>
#       <h4 class="title-create" style="text-style:none;">OU</h4>
#       <%= form.submit "LAISSE LE HASARD FAIRE", class: "btn-create-team"%>
#   <% end %>
#   </div>
# </div>

# <h2 class="flexy light-blue-bar">CRÉATION DE LIGUE</h2>
#   <%= simple_form_for [@league] do |f| %>
#     <%= f.input :name %>
#     <div class="player-selection">
#       <% @friends.each do |friend| %>
#         <input type="checkbox" name="user[<%= friend.username%>]" id="<%= friend.username%>" class="check-player" />
#         <label for="<%= friend.username %>"><%= friend.username.upcase %><%= cl_image_tag friend.photo.key, class: "avatar-selection" %></label>
#       <% end %>
#     </div>
#     <%= f.submit 'Suivant', class: "btn btn-primary" %>
#   <% end %>

  # <h2 class="flexy light-blue-bar">CRÉATION DE LIGUE</h2>
  # <%= simple_form_for [@league] do |f| %>
  #   <%= f.input :name %>
  #   <%= f.input :users,
  #                 as: :check_boxes,
  #                 collection: @friends.map(&:username),
  #                 input_html: { multiple: true, class: "tag-selector" },
  #                 :label_method => lambda { |b| image_tag(User.find_by(username: b).photo.url) },
  #                 item_wrapper_class: 'tag-item' %>
  #   <%= f.submit 'Suivant', class: "btn btn-primary" %>
  # <% end %>


  <%# <script>src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.10.1/lottie.min.js"</script>

  <script>src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.10.1/lottie.min.js"</script>
<div id="animation container">
<script>
var animation = lottie.loadAnimation({
  container: document.getElementByID('animation container'),
  path: "/test.json",
  render: 'svg',
  loop: true,
  autoplay: true,
  name: 'test animation'
})
</script>
</div>

<%# <i class="fa-solid fa-arrow-down image-clignote"></i> %>
    <%# <a href="#sec-2">
      <div class="scroll-down"></div>
    </a> %>

    <%#
<p class="image-clignote">⌄</p> %>

<div id="sec-2">
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO
HEEEELLLLO

</div>

<div class="navbar navbar-expand-sm navbar-light navbar-lewagon">
  <div class="container-fluid">

    <a href="/" class="logo-home">
      <h4>PETANQUE</h4>
      <h4>SOCIAL</h4>
      <h4>CLUB</h4>
    </a>
    <button class="navbar-toggler border-0" onclick="this.blur();" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <% if current_user %>
      <%= image_tag current_user.profile_pic, class: "avatar-yellow avatar-medium", data: { bs_toggle: "dropdown" } %>
    <% end %>

    </button>

    <div class="collapse navbar-collapse padding_right" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto align-items-end pr-5">
        <% if user_signed_in? %>
          <li class="nav-item nav-item-navabar">
          <%= link_to "Mes infos", edit_user_registration_path %>
          </li>
          <li class="nav-item nav-item-navabar">
          <%= link_to "Se déconnecter", destroy_user_session_path, data: {turbo_method: :delete} %>
          </li>
        <% else %>
          <li class="nav-item">
            <%= link_to "Login", new_user_session_path, class: "nav-link nav-link-login" %>
          </li>
        <% end %>
      </ul>
    </div>
  </div>
</div>

<%= form_with url: "/community", method: :get do %>
  <%= text_field_tag :query, params[:query], placeholder: "nanard ou bernard@gmail.com", id: "searchbar" %>
  <div class="flexy">
  <button class="btn-small btn-smally" id="btn-search" type="submit" label="search">RECHERCHER</button>
  </div>
<% end %>
