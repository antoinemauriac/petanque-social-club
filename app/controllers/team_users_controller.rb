class TeamUsersController < ApplicationController

  def new
    @team_user = TeamUser.new
    @users = User.all
    @league = League.find(params[:league_id])
  end

  def create
    @league = League.find(params[:league_id])
    @teams = []

    # this is returning an array of all user selected in the view
    @users = params[:team_users][:user].reject { |c| c.empty? }
    # this is returning an array of arrays of 2 users
    @users = @users.each_slice(2).to_a

    # this create team for each 2 user
    @users.each do |two_user|
      @team = Team.new(league: @league)
      @team.save!
    # this associate users and team to team user
      two_user.each do |selected|
        user = User.find_by(username: selected)
        TeamUser.create!(user: user, team: @team)
      end
      if @teams.any?
        @teams.each do |team|
          @game = Game.create!(league: @league)
          GameTeam.create!(team: team, game: @game)
          GameTeam.create!(team: @team, game: @game)
        end
      end
      @teams << @team
    end
    redirect_to league_path(@league)
  end

  private

  def team_user_params
    params.require(:team_user).permit(:user, :team)
  end
end
