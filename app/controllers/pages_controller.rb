class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
    @number_of_games = @user.teams.map { |team| team.games_played }.flatten.sum
    # @number_of_winss = Game.where(game_winner: @user.teams).count
    @number_of_wins = @user.teams.map { |team| team.number_of_wins }.sum
    @number_of_loses = (@number_of_games - @number_of_wins)
    @number_of_points_for = @user.teams.map { |team| team.points_for }.sum
    @number_of_points_against = @user.teams.map { |team| team.points_against }.sum
    @pourcentage_of_wins = ((@number_of_wins.to_f / @number_of_games).round(2) * 100).to_i
    @pourcentage_of_loses = 100 - @pourcentage_of_wins

    @leagues = []
    League.all.each do |league|
      if Team.where(league: league).map { |team| TeamUser.where(team: team).map { |t| t.user }}.flatten.include?(current_user)
        @leagues << league
      end
    end

    @number_of_leagues_played = @leagues.count
  end

  def accueil
  end

end

# @teammates = @users.teams
# hash = {}

# array = Team.all.map { |team| team.team_users }
# array.select { |array| array[0].user == User.first || array[1].user == User.first }

# current_user.teams
