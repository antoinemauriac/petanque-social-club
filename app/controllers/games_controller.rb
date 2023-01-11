class GamesController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @user = current_user
    @current_user_games = @user.games.where(league: @league)
    @other_games = @league.games.where.not(id: @current_user_games)
  end

  def new
    @game = Game.new
    @user = current_user
    @friends = @user.friends.to_a.push(@user).reverse
  end

  def create
    @game = Game.new
    @players = params[:user].keys.map { |username| User.find_by(username: username) }
    if @players.size == 4 && @players.include?(current_user)
      if @game.save
        @players.each do |player|
          SelectedPlayer.create(game: @game, user: player)
        end
        redirect_to choose_game_teams_game_path(@game)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_game_path
      flash[:notice] = 'Il faut 4 joueurs et que tu sois dans les 4'
    end
  end

  def choose_game_teams
    @game = Game.find(params[:id])
    @players = @game.selected_players.map(&:user)
    @usernames = @players.map(&:username)
    @team_user = TeamUser.new
  end

  def choose_game_teams_create
    @game = Game.find(params[:id])
    @pairs_of_players = params[:team_user].values.map { |id| User.find(id) }.each_slice(2).to_a

    @team_one = Team.create
    @team_two = Team.create

    @pairs_of_players.first.each do |player|
      TeamUser.create(user: player, team: @team_one)
    end

    @pairs_of_players.last.each do |player|
      TeamUser.create(user: player, team: @team_two)
    end

    GameTeam.create!(team: @team_one, game: @game)
    GameTeam.create!(team: @team_two, game: @game)

    if @game.save
      redirect_to game_path(@game)
    else
      redirect_to choose_game_teams_game_path(@game)
    end
  end

  def show
    @game = Game.find(params[:id])
    @team_one = @game.teams.first
    @team_two = @game.teams.last
  end

  def edit
    @game = Game.find(params[:id])
    @team1 = @game.teams.first
    @team2 = @game.teams.last
  end

  def update
    # raise
    @game = Game.find(params[:id])
    @league = @game.league
    @team1 = @game.teams.first
    @team2 = @game.teams.last

    @game.update(game_params)
    if !@game.score_first_team.nil? && !@game.score_second_team.nil?
      if (@game.score_first_team == 13 && @game.score_second_team < 13) || (@game.score_first_team < 13 && @game.score_second_team == 13)

        if @game.score_first_team > @game.score_second_team
          @game.game_winner = @team1.id
          @team1.number_of_wins += 1
        else
          @game.game_winner = @team2.id
          @team2.number_of_wins += 1
        end

        if (@game.score_first_team == 13 && @game.score_second_team == 0) || (@game.score_first_team == 0 && @game.score_second_team == 13)
          badge_first_fanny
        end

        @team1.points_for += @game.score_first_team
        @team1.points_against += @game.score_second_team
        @team1.games_played += 1

        @team2.points_for += @game.score_second_team
        @team2.points_against += @game.score_first_team
        @team2.games_played += 1

        @team2.save
        @team1.save

        @game.status = true
        @game.save

        # fin_de_league
        if @game.league.present?
          @number_of_games_finished = @league.games.where(status: true).count
          @number_total_of_games = @league.games.count
          if @number_of_games_finished == @number_total_of_games
            @league.league_winner = @league.teams.sort_by { |team| [-team.number_of_wins, -(team.points_for - team.points_against)] }.first.id
            @league.status = true
            @league.save
          end

          if @league.status == true
            badge_first_league_winner
            badge_generation
          end

          if @league.status == true
            redirect_to league_path(@league)
          else
            redirect_to league_games_path(@game.league)
          end
        else
          redirect_to game_path(@game)
        end

      else
        # flash[:notice] = 'Score non valide !'
        render :edit, status: :unprocessable_entity
      end
    else
      flash[:notice] = 'Score non valide !'
      render :edit, status: :unprocessable_entity
    end
  end

  def badge_first_league_winner
    @first_vainqueur = Team.find(@league.league_winner).users.first
    @second_vainqueur = Team.find(@league.league_winner).users.last

    if @first_vainqueur.badge.first_league_winner == false
      @first_vainqueur.badge.update!(first_league_winner: true)
      if @first_vainqueur == current_user
        flash[:notice] = 'Nouveau badge débloqué'
      end
    end

    if @second_vainqueur.badge.first_league_winner == false
      @second_vainqueur.badge.update!(first_league_winner: true)
      if @second_vainqueur == current_user
        flash[:notice] = 'Nouveau badge débloqué'
      end
    end
  end

  def badge_generation
    @first_vainqueur = Team.find(@league.league_winner).users.first
    @second_vainqueur = Team.find(@league.league_winner).users.last

    if @first_vainqueur.badge.generation == false && (@first_vainqueur.date_of_birth.year - @second_vainqueur.date_of_birth.year).abs > 30
      @first_vainqueur.badge.update!(generation: true)
      if @first_vainqueur == current_user
        flash[:alert] = 'Nouveau badge débloqué'
      end
    end

    if @second_vainqueur.badge.generation == false && (@first_vainqueur.date_of_birth.year - @second_vainqueur.date_of_birth.year).abs > 30
      @second_vainqueur.badge.update!(generation: true)
      if @second_vainqueur == current_user
        flash[:alert] = 'Nouveau badge débloqué'
      end
    end
  end

  def badge_first_fanny
    if @team1.id == @game.game_winner
      @first_game_winner = @team1.users.first
      @second_game_winner = @team1.users.last
    else
      @first_game_winner = @team2.users.first
      @second_game_winner = @team2.users.last
    end

    if @first_game_winner.badge.first_fanny == false
      @first_game_winner.badge.update!(first_fanny: true)
      if @first_game_winner == current_user
        flash[:notice] = 'Nouveau badge débloqué'
      end
    end

    if @second_game_winner.badge.first_fanny == false
      @second_game_winner.badge.update!(first_fanny: true)
      if @second_game_winner == current_user
        flash[:notice] = 'Nouveau badge débloqué'
      end
    end
  end

  private

  def game_params
    params.require(:game).permit(:score_first_team, :score_second_team, :user, :game_id)
  end
end
