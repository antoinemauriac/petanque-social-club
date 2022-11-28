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

5.times do
  User.create!(email: Faker::Internet.email, username: Faker::Internet.username, password: "123456", date_of_birth: Faker::Date.between(from: "1930-01-01", to: "2015-01-01"))
end

user1 = User.all[0]
user2 = User.all[1]
user3 = User.all[2]
user4 = User.all[3]

ligue1 = League.create(name: "La premier league")
game1 = Game.create!(league: ligue1)
team1 = Team.create!(league: League.first)
team2 = Team.create!(league: League.first)

team_user1 = TeamUser.create!(user: user1, team: team1)
team_user2 = TeamUser.create!(user: user2, team: team1)
team_user3 = TeamUser.create!(user: user3, team: team2)
team_user4 = TeamUser.create!(user: user4, team: team2)

game_team1 = GameTeam.create!(team: team1, game: game1)
game_team2 = GameTeam.create!(team: team2, game: game1)

TeamUser.where(team: team1).each { |t| t.user.username }

teams_game_array  = GameTeam.where(game: game1).map { |gt| TeamUser.where(team: gt.team)}
game_players = teams_game_array.map { |t| t.map { |u| u.user.username} }
p game_players
