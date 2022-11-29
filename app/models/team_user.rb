class TeamUser < ApplicationRecord
  belongs_to :user
  belongs_to :team

  # renvoie les deux players d'une team

  def self.players_of_the_team(team)
    where(team: team).map { |t| t.user }
  end
end
