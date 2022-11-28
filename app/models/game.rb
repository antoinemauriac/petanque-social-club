class Game < ApplicationRecord
  # validates :first_team, presence: true
  # validates :second_team, presence: true

  belongs_to :league
  has_many :game_teams
  has_many :teams, through: :game_teams
end
