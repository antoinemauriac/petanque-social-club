class GameTeam < ApplicationRecord
  belongs_to :game
  belongs_to :team

  def self.teams_of_the_game(game)
    where(game: game).map { |game| game.team }
  end
end
