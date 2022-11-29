class Team < ApplicationRecord
  has_many :game_teams
  has_many :games, through: :game_teams

  belongs_to :league

  has_many :teams_users
  has_many :users, through: :team_users

  #renvoie tous les players d'une ligue donnée
  def self.players_of_a_league(league)
      where(league: league).map { |team| TeamUser.where(team: team).map { |t| t.user }}.flatten
  end

  # renvoie TOUTES les teams d'une ligue donnée
  def self.teams_of_a_league(league)
    where(league: league)
  end

  # renvoie UNE team donnée d'une ligue donnée

  def self.one_team_of_a_league(league, team)
    where(league: league).find(team)
  end

end
