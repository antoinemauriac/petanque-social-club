class Game < ApplicationRecord
  belongs_to :league, optional: true
  has_many :game_teams
  has_many :teams, through: :game_teams
end
