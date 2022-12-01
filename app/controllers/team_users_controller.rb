class TeamUsersController < ApplicationController

  def new
    @team_user = TeamUser.new
    @users = User.all
    @league = League.find(params[:league_id])
  end

  def create
    @league = League.find(params[:league_id])
    @users = params[:team_user][:user].reject { |c| c.empty? }
    @users = @users.each_slice(2).to_a
    @users.each do |two_user|
      @team = Team.new(league: @league)
      @team.save!
      two_user.each do |selected|
        user = User.find_by(username: selected)
        TeamUser.create!(user: user, team: @team)
      end
    end
    redirect_to league_path(@league)
  end

  private

  def team_user_params
    params.require(:team_user).permit(:user, :team)
  end
end
