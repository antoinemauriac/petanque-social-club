class Users::GamesController < ApplicationController
  def index
    @user = current_user
    @games = @user.games.where(league_id: nil)
    @current_games = @games.where(status: nil)
    @finished_games = @games.where(status: true)
  end
end
