class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def number_of_wins_with(first_player_id, second_player_id)
    Team.all.select { |t| (t.team_users.first.user_id == first_player_id && t.team_users.last.user_id == second_player_id) || (t.team_users.first.user_id == second_player_id && t.team_users.last.user_id == first_player_id) }.map { |u| u.number_of_wins }.sum
  end

  def number_of_played_with(first_player_id, second_player_id)
    Team.all.select { |t| (t.team_users.first.user_id == first_player_id && t.team_users.last.user_id == second_player_id) || (t.team_users.first.user_id == second_player_id && t.team_users.last.user_id == first_player_id) }.map { |u| u.games_played }.sum
  end

  def profile
    @user = current_user

    # @number_of_games_played = @user.teams.map { |team| team.games_played }.flatten.sum
    @number_of_wins = @user.teams.map { |team| team.number_of_wins }.sum
    @number_of_loses = (@user.number_of_games_played - @number_of_wins)
    @number_of_points_for = @user.teams.map { |team| team.points_for }.sum
    @number_of_points_against = @user.teams.map { |team| team.points_against }.sum

    if @number_of_wins > 0
      @pourcentage_of_wins = ((@number_of_wins.to_f / @user.number_of_games_played).round(2) * 100).to_i
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

    # CONSEIL DE CLASSE

    @teammates = @user.teams.reject { |t| t.games_played <= 2  }.map { |team| team.team_users }.map { |t| t.reject { |tu| tu.user_id == @user.id }}.flatten.map { |tp| tp.user_id }.uniq
    if @teammates.size >= 1
      @teammates_sorted = @teammates.sort_by { |p| (Team.all.select { |t| (t.team_users.first.user_id == @user.id && t.team_users.last.user_id == p) || (t.team_users.first.user_id == p && t.team_users.last.user_id == @user.id)}.map { |u| u.number_of_wins }.sum)/(Team.all.select { |t| (t.team_users.first.user_id == @user.id && t.team_users.last.user_id == p) || (t.team_users.first.user_id == p && t.team_users.last.user_id == @user.id) }.map { |u| u.games_played }.sum)}
      @worst_teammate_id = @teammates_sorted.first
      @worst_teammate = User.find(@worst_teammate_id)
      @perc_of_loses = (((number_of_played_with(@user.id, @worst_teammate_id) - number_of_wins_with(@user.id, @worst_teammate_id)).to_f / number_of_played_with(@user.id, @worst_teammate_id)).round(2) * 100).to_i
      @best_teammate_id = @teammates_sorted.last
      @best_teammate = User.find(@best_teammate_id)
      @perc_of_wins = ((number_of_wins_with(@user.id, @best_teammate_id).to_f / number_of_played_with(@user.id, @best_teammate_id)).round(2) * 100).to_i
    end
  end

  def accueil
  end

end
