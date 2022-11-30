class TeamUsersController < ApplicationController
  def create
    params[:team_user][:user].flatten.drop(1).each do |selected|
      user = User.find_by(username: selected)
      raise
      TeamUser.create!(user: user)
    end
  end

  private

  def team_user_params
    params.require(:team_user).permit(:user, :team_id)
  end
end
