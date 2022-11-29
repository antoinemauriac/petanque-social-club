class GamesController < ApplicationController
  def index
    @games = Game.all
    @league = League.find(params[:league_id])
  end

  def new
    @game = Game.new
    @league = League.find(params[:league_id])
  end

  def create
    @league = League.find(params[:league_id])
    @game = Game.new(game_params)
  end

  def show
    @game = Game.find(params[:id])
    @games = Game.all
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
  end

  private

  def game_params
    params.require(:game).permit(:score_first_team, :score_second_team, :game_winner, :status)
  end
end
