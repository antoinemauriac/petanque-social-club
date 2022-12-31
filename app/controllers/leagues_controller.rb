class LeaguesController < ApplicationController

  def index
    @user = current_user
    @leagues = @user.leagues
  end

  def show
    @league = League.find(params[:id])
    @games = @league.games
    @teams_sorted = @league.teams.sort_by { |team| [-team.number_of_wins, -(team.points_for - team.points_against)] }

    return unless @league.status == true

    @first_winner = Team.find(@league.league_winner).users.first
    @second_winner = Team.find(@league.league_winner).users.last
  end

  def new
    @user = current_user
    @league = League.new
    @friends = []
    @friends.push(@user)
    @user.friends.each do |friend|
      @friends.push(friend)
    end
  end

  def create
    @league = League.new(league_params)
    if @league.save
      @players = params[:user].keys.map { |username| User.find_by(username: username) }
      @players.each do |player|
        SelectedUser.create(league: @league, user: player)
      end
      redirect_to choose_mode_league_path(@league)
    else
      redirect_to new_league_path
    end
  end

  def choose_mode
    @league = League.find(params[:id])
  end

  def choose_mode_create
    @league = League.find(params[:id])
    if params[:commit] == "HASARD"
      random
    else
      redirect_to choose_teams_league_path(@league)
    end
  end

  def random
    @league = League.find(params[:id])
    @teams = []
    @pairs_of_players = @league.selected_users.map(&:user).shuffle.each_slice(2).to_a
    @pairs_of_players.each do |pair|
      @team = Team.create(league: @league)
      pair.each do |player|
        TeamUser.create(user: player, team: @team)
      end
      if @teams.any?
        @teams.each do |team|
          @game = Game.create(league: @league)
          GameTeam.create!(team: team, game: @game)
          GameTeam.create!(team: @team, game: @game)
        end
      end
      @teams.push(@team)
    end
    redirect_to league_games_path(@league)
  end

  def choose_teams
    @league = League.find(params[:id])
    @players = @league.selected_users.map(&:user)
    @usernames = @players.map(&:username)
    @team_user = TeamUser.new
    @number_of_teams = @players.size / 2
  end

  def choose_teams_create
    @league = League.find(params[:id])
    @pairs_of_players = params[:team_user].values.map { |id| User.find(id) }.each_slice(2).to_a
    @teams = []
    @pairs_of_players.each do |pair|
      @team = Team.create(league: @league)
      pair.each do |player|
        TeamUser.create(user: player, team: @team)
      end
      if @teams.any?
        @teams.each do |team|
          @game = Game.create(league: @league)
          GameTeam.create!(team: team, game: @game)
          GameTeam.create!(team: @team, game: @game)
        end
      end
      @teams.push(@team)
    end
    redirect_to league_games_path(@league)
  end

  private

  def league_params
    params.require(:league).permit(:league_id, :name, :status, :league_winner, :admin_user, :rand, :users)
  end
end
