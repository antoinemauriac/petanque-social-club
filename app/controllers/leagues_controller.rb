class LeaguesController < ApplicationController

  def index
    @leagues = []
    League.all.each do |league|
      if Team.where(league: league).map { |team| TeamUser.where(team: team).map { |t| t.user }}.flatten.include?(current_user)
        @leagues << league
      end
    end
    return @leagues
  end

  def show
    @league = League.find(params[:id])
    @games = @league.games
    @leagues = League.all
    @message = Message.new
  end

  def new
    @league = League.new
  end

  def create
    @league = League.create!(league_params)
    @league.admin_user = current_user
    redirect_to new_league_team_user_path(@league)
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
    params.require(:league).permit(:league_id, :name, :status, :league_winner, :admin_user)
  end
end
