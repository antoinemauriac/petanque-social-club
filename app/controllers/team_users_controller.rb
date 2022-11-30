class TeamUsersController < ApplicationController
  def create
    params[:team_user][:user].flatten.drop(1).each do |selected|
      user = User.find_by(username: selected)
      team = Team.find(params[:team_user][:team])
      TeamUser.create!(user: user, team: team)
    end
    
  end

  private

  def team_user_params
    params.require(:team_user).permit(:user, :team)
  end
end
