class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @number_of_wins = @user.teams.sum(:number_of_wins)
    @number_of_loses = (@user.number_of_games_played - @number_of_wins)
    @number_of_points_for = @user.teams.sum(&:points_for)
    @number_of_points_against = @user.teams.sum(&:points_against)
    @diff = @number_of_points_for - @number_of_points_against

    if @user.number_of_games_played.positive?
      @pourcentage_of_wins = ((@number_of_wins.to_f / @user.number_of_games_played).round(2) * 100).to_i
      @pourcentage_of_loses = 100 - @pourcentage_of_wins
    end

    @leagues = @user.leagues
    @number_of_leagues_played = @leagues.count
    @finished_leagues = @leagues.where(status: true)
    @number_of_leagues_wins = @finished_leagues.where(league_winner: @user.teams).count

    # CONSEIL DE CLASSE

    relevant_teams = @user.teams.where(games_played: 2...)
    @teammates = User.joins(team_users: :team).where(teams: { id: relevant_teams }).where.not(id: @user).to_a.uniq!
    if @teammates.nil?
      @teammates = []
    end
    return if @teammates.nil? || @teammates.size < 2
    @teammates_sorted = @teammates.sort_by { |mate| (@user.number_of_wins_with(mate).to_f / @user.number_of_played_with(mate)) }
    @worst_teammate = @teammates_sorted.first
    @perc_of_loses = (@user.number_of_loses_with(@worst_teammate).to_f / @user.number_of_played_with(@worst_teammate)
    .round(2) * 100).to_i
    @best_teammate = @teammates_sorted.last
    @perc_of_wins = (@user.number_of_wins_with(@best_teammate).to_f / @user.number_of_played_with(@best_teammate)
    .round(2) * 100).to_i
  end
end
