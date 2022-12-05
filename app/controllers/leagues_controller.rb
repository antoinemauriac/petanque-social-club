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
    if @league.status == true
    @first_winner = Team.find(@league.league_winner).team_users.map { |tu| tu.user }.first
    @second_winner = Team.find(@league.league_winner).team_users.map { |tu| tu.user }.last
    end
    # @leagues = League.all
    # @message = Message.new
  end

  def new
    @league = League.new
    @users = User.all
  end

  def create

    @league = League.create!(league_params)
    @selected_users = params[:user]
    @selected_friends = []
    @selected_users.keys.each do |f|
      @selected_friends << SelectedUser.create(league: @league, user_id: User.find(f).id)
    end




      if params[:commit] == "random"
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

  # def edit
  #   @league = League.find(params[:id])
  # end

  # def update
  #  @league = League.find(params[:id])
  #  @league.update(league_params)
  # end

  private

  def league_params
    params.require(:league).permit(:league_id, :name, :status, :league_winner, :admin_user, :rand)
  end
end
