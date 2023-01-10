class Game < ApplicationRecord
  belongs_to :league, optional: true
  has_many :game_teams
  has_many :teams, through: :game_teams
  has_many :team_users, through: :teams
  has_many :users, through: :team_users
  has_many :selected_players
end
