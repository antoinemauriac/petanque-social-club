class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
    @leagues = League.all
  end

  def new
    @league = League.new
    @team_user = TeamUser.new
    @users = User.all
  end

  def create
    @league = League.new(league_params)
    @league.admin_user = current_user
  end

  # def edit
  #   @league = League.find(params[:id])
  # end

  # def update
  #  @league = League.find(params[:id])
  #  @league.update(league_params)
  # end

  private

  def league_params
    params.require(:league).permit(:name, :status, :league_winner, :admin_user)
  end
end
