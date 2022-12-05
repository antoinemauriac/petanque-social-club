class Game < ApplicationRecord
  # validates :score_first_team, presence: true
  # validates :score_second_team, presence: true

  belongs_to :league
  has_many :game_teams
  has_many :teams, through: :game_teams
end
