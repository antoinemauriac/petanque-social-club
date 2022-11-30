class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
    @leagues = League.all
    @message = Message.new
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.user = current_user
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
