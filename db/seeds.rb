# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  TeamUser.destroy_all
  User.destroy_all
  GameTeam.destroy_all
  Team.destroy_all
  Game.destroy_all
  League.destroy_all

  League.create(name: "La premier league")

  10.times do
    User.create!(email: Faker::Internet.email, username: Faker::Internet.username, password: "123456", date_of_birth: Faker::Date.between(from: "1930-01-01", to: "2015-01-01"))
  end

  10.times do
    Game.create!(league: League.first)
  end

  5.times do
    Team.create!(league: League.first)
  end

  # def create_team_user
  #   k = -2
  #   for j in (1..5) do
  #     k += 2
  #     for i in (k..k+1) do
  #       TeamUser.create!(user: User.all[i], team: Team.all[j])
  #     end
  #   end
  # end

  # create_team_user

  TeamUser.create!(user: User.all[0], team: Team.all[0])
  TeamUser.create!(user: User.all[9], team: Team.all[0])
  TeamUser.create!(user: User.all[2], team: Team.all[1])
  TeamUser.create!(user: User.all[3], team: Team.all[1])
  TeamUser.create!(user: User.all[4], team: Team.all[2])
  TeamUser.create!(user: User.all[7], team: Team.all[2])
  TeamUser.create!(user: User.all[6], team: Team.all[3])
  TeamUser.create!(user: User.all[5], team: Team.all[3])
  TeamUser.create!(user: User.all[8], team: Team.all[4])
  TeamUser.create!(user: User.all[1], team: Team.all[4])

  GameTeam.create!(team: Team.all[0], game: Game.all[0])
  GameTeam.create!(team: Team.all[4], game: Game.all[0])
  GameTeam.create!(team: Team.all[0], game: Game.all[1])
  GameTeam.create!(team: Team.all[2], game: Game.all[1])
  GameTeam.create!(team: Team.all[0], game: Game.all[2])
  GameTeam.create!(team: Team.all[3], game: Game.all[2])
  GameTeam.create!(team: Team.all[0], game: Game.all[3])
  GameTeam.create!(team: Team.all[1], game: Game.all[3])
  GameTeam.create!(team: Team.all[1], game: Game.all[4])
  GameTeam.create!(team: Team.all[4], game: Game.all[4])
  GameTeam.create!(team: Team.all[1], game: Game.all[5])
  GameTeam.create!(team: Team.all[3], game: Game.all[5])
  GameTeam.create!(team: Team.all[1], game: Game.all[6])
  GameTeam.create!(team: Team.all[2], game: Game.all[6])
  GameTeam.create!(team: Team.all[2], game: Game.all[7])
  GameTeam.create!(team: Team.all[4], game: Game.all[7])
  GameTeam.create!(team: Team.all[2], game: Game.all[8])
  GameTeam.create!(team: Team.all[3], game: Game.all[8])
  GameTeam.create!(team: Team.all[3], game: Game.all[9])
  GameTeam.create!(team: Team.all[4], game: Game.all[9])


#renvoie les DEUX players d'une team donnée

# TeamUser.where(team: Team.all[2]).map { |team| team.user }

# team.users

#renvoie UN player donné d'une team donnée

# TeamUser.where(team: Team.all[2]).map { |team| team.user }.select { |user| user = User.find(765) }

#renvoie les DEUX teams d'un game donné

# GameTeam.where(game: Game.all[4]).map { |game| game.team }

# Game.all[4].teams

#renvoie UNE team donnée d'un game donné

# GameTeam.where(game: Game.all[4]).map { |game| game.team }.select { |team| team.id = Team.all[2].id }

#renvoie TOUTES les teams d'une ligue donnée

# Team.where(league: League.first)



#renvoie UNE team donnée d'une ligue donnée

# Team.where(league: League.first).find(Team.all[3].id)

#renvoie tous les players d'une ligue donnée

# Team.where(league: League.first).map { |team| TeamUser.where(team: team).map { |t| t.user }}.flatten


# teams_game_array  = GameTeam.where(game: game1).map { |gt| TeamUser.where(team: gt.team)}
# game_players = teams_game_array.map { |t| t.map { |u| u.user.username} }
# p game_players
