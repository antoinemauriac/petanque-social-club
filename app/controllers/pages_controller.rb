class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
    @number_of_games = @user.teams.map { |team| team.games_played }.flatten.sum
    # @number_of_winss = Game.where(game_winner: @user.teams).count
    @number_of_wins = @user.teams.map { |team| team.number_of_wins }.sum
    @number_of_points_for = @user.teams.map { |team| team.points_for }.sum
    @number_of_points_against = @user.teams.map { |team| team.points_against }.sum
    # @leagues = League.all
    # @teams = Team.all.map { |team| team.team_users.include?(current_user) }
    # @games = Game.where(game_winner: User.first.teams)

  end

end
