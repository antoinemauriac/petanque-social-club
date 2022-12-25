class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def number_of_wins_with(first_player, second_player)
    users_teams = first_player.teams.joins(team_users: :user).where(users: {id: second_player })
    users_teams.sum(:number_of_wins)
    # users_teams = Team.all.select do |t|
    #   (t.team_users.first.user_id == first_player_id && t.team_users.last.user_id == second_player_id) ||
    #     (t.team_users.first.user_id == second_player_id && t.team_users.last.user_id == first_player_id)
    # end
    # users_teams.map { |team| team.number_of_wins }.sum
  end

  def number_of_played_with(first_player, second_player)
    users_teams = first_player.teams.joins(team_users: :user).where(users: {id: second_player })
    users_teams.sum(:games_played)
    # Team.all.select { |t| (t.team_users.first.user_id == first_player_id && t.team_users.last.user_id == second_player_id) || (t.team_users.first.user_id == second_player_id && t.team_users.last.user_id == first_player_id) }.map { |u| u.games_played }.sum
  end

  def number_of_loses_with(first_player, second_player)
    number_of_played_with(first_player, second_player) - number_of_wins_with(first_player, second_player)
  end

  def profile
    @user = current_user

    # @number_of_games_played = @user.teams.map { |team| team.games_played }.flatten.sum
    @number_of_wins = @user.teams.sum(:number_of_wins)
    @number_of_loses = (@user.number_of_games_played - @number_of_wins)
    @number_of_points_for = @user.teams.sum(&:points_for)
    @number_of_points_against = @user.teams.sum(&:points_against)

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

    # @teammates = @user.teams.reject { |t| t.games_played <= 2  }.map { |team| team.team_users }.map { |t| t.reject { |tu| tu.user_id == @user.id }}.flatten.map { |tp| tp.user_id }.uniq

    relevant_teams = @user.teams.where(games_played: 2...)
    @teammates = User.joins(team_users: :team).where(teams: { id: relevant_teams } ).where.not(id: @user)

    return unless @teammates.size >= 2

    @teammates_sorted = @teammates.sort_by { |mate| number_of_wins_with(@user, mate) / number_of_played_with(@user, mate) }
    @worst_teammate = @teammates_sorted.last
    @perc_of_loses = (number_of_loses_with(@user, @worst_teammate).to_f / number_of_played_with(@user, @worst_teammate)
    .round(2) * 100).to_i
    @best_teammate = @teammates_sorted.first
    @perc_of_wins = (number_of_wins_with(@user, @best_teammate).to_f / number_of_played_with(@user, @best_teammate)
    .round(2) * 100).to_i

  end

  def accueil
  end

end
