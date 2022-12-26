class LeaguesController < ApplicationController

  def index
    @user = current_user
    @leagues = @user.leagues
  end

  def show
    @league = League.find(params[:id])
    @games = @league.games
    @teams_sorted = @league.teams.sort_by { |team| [-team.number_of_wins, -(team.points_for - team.points_against)] }

    return unless @league.status == true

    @first_winner = Team.find(@league.league_winner).users.first
    @second_winner = Team.find(@league.league_winner).users.last
  end

  def new
    @league = League.new
    @users = []
    @users.push(current_user)
    current_user.friends.each do |friend|
      @users.push(friend)
    end
  end

  def create
    @league = League.create!(league_params)
    @selected_users = params[:user]
    @selected_friends = []
    @selected_users.keys.each do |f|
      @selected_friends << SelectedUser.create(league: @league, user_id: User.find(f).id)
    end

      if params[:commit] == "LAISSE LE HASARD FAIRE"
        @teams_all = []
        @users = @selected_friends.shuffle().each_slice(2).to_a
        @users.each do |two_user|
          @team = Team.new(league: @league)
          @team.save!
          # this associate users and team to team user

          two_user.each do |selected|
            user = User.find(selected.user_id)
            TeamUser.create!(user: user, team: @team)
          end

          if @teams_all.any?

            @teams_all.each do |team|
              @game = Game.create!(league: @league)
              GameTeam.create!(team: team, game: @game)
              GameTeam.create!(team: @team, game: @game)
            end

          end
          @teams_all << @team

        end
          redirect_to league_path(@league)
      else
        redirect_to new_league_team_user_path(@league)
      end
  end

  private

  def league_params
    params.require(:league).permit(:league_id, :name, :status, :league_winner, :admin_user, :rand)
  end
end
