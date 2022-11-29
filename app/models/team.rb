class Team < ApplicationRecord
  has_many :game_teams
  has_many :games, through: :game_teams

  belongs_to :league

  has_many :teams_users
  has_many :users, through: :team_users
end
