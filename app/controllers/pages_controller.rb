class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user

    @number_of_games_played = @user.teams.map { |team| team.games_played }.flatten.sum
    @number_of_wins = @user.teams.map { |team| team.number_of_wins }.sum
    @number_of_loses = (@number_of_games_played - @number_of_wins)
    @number_of_points_for = @user.teams.map { |team| team.points_for }.sum
    @number_of_points_against = @user.teams.map { |team| team.points_against }.sum

    if @number_of_wins > 0
      @pourcentage_of_wins = ((@number_of_wins.to_f / @number_of_games_played).round(2) * 100).to_i
      @pourcentage_of_loses = 100 - @pourcentage_of_wins
    else
      @pourcentage_of_wins = 0
      @pourcentage_of_loses = 0
    end

    @leagues = []
    League.all.each do |league|
      if Team.where(league: league).map { |team| team.users }.flatten.include?(current_user)
        @leagues << league
      end
    end

    @number_of_leagues_played = @leagues.count

    @finished_leagues = @leagues.select { |league| league.status == true }
    @number_of_leagues_wins = @finished_leagues.map { |league| league.league_winner }.map { |id| Team.find(id) }.map { |team| team.users }.flatten.select { |u| u == current_user }.count

    @user1 = User.all[rand(0..5)]
    @user2 = User.all[rand(6..10)]
  end

  def accueil
  end

end

# @teammates = @users.teams
# hash = {}

# array = Team.all.map { |team| team.team_users }
# array.select { |array| array[0].user == User.first || array[1].user == User.first }

# current_user.team
