class Game < ApplicationRecord
  # validates :score_first_team, presence: true
  # validates :score_second_team, presence: true
  # validates :score_first_team, length: { in: 0..13 }
  # validates :score_second_team, length: { in: 0..13 }

  belongs_to :league
  has_many :game_teams
  has_many :teams, through: :game_teams
end
