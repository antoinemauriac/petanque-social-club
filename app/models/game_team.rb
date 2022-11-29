class GameTeam < ApplicationRecord
  belongs_to :game
  belongs_to :team

  #renvoie les DEUX teams d'un game donné

  def self.teams_of_the_game(game)
    where(game: game).map { |g| g.team }
  end

end
