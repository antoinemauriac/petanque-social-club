class GamesController < ApplicationController
  def index
    @league = League.find(params[:league_id])
  end

  # def new
  #   @game = Game.new
  #   @league = League.find(params[:league_id])
  # end

  # def create
  #   @league = League.find(params[:league_id])
  #   @game = Game.new(game_params)
  # end

  def show
    @game = Game.find(params[:id])
    # @games = Game.all
    @team1 = @game.teams.first
    @team2 = @game.teams.last
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @team1 = @game.teams.first
    @team2 = @game.teams.last
    @game.update(game_params)

    if @game.score_first_team > @game.score_second_team
    @game.game_winner = @team1.id
    @team1.number_of_wins += 1
    else
    @game.game_winner = @team2.id
    @team2.number_of_wins += 1
    end

    @team1.points_for += @game.score_first_team
    @team1.points_against += @game.score_second_team
    @team1.games_played += 1

    @team2.points_for += @game.score_second_team
    @team2.points_against += @game.score_first_team
    @team2.games_played += 1

    @team2.save
    @team1.save
    @game.status = false
    @game.save

    redirect_to league_path(@game.league)
  end

  private

  def game_params
    params.require(:game).permit(:score_first_team, :score_second_team)
  end
end
