#ou trouvver la valeur d'un score

# p game = Game.last
# p ""
# p ""
# game.score_first_team = 13
# game.score_second_team = 9

# if game.score_first_team > 13 || game.score_second_team > 13
# p "one of the score is too high"
# elsif game.score_first_team == 13
#   game.game_winner = GameTeam.where(game: game).map { |g| g.team }.first.id # ou last
#   p game.game_winner
# else
#   game.game_winner = GameTeam.where(game: game).map { |g| g.team }.last.id # ou first
#   p game.game_winner
# end

# # comment determiner quelle team est la première // par l'id ??
# # Je pense que selon le mode de generation des teams on pourras choisir entre #last #first pour savoir quelle est la première team (pour .score,)

# p ""
# p ""
# p game
# p ""
# p GameTeam.where(game: game).map { |g| g.team }

# dans nos seed la .first est celle avec l'id le plus faible
