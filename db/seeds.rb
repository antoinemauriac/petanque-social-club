# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TeamUser.destroy_all
User.destroy_all
Team.destroy_all
Game.destroy_all
League.destroy_all

5.times do
  User.create(email: Faker::Internet.email, username: Faker::Internet.username, password: 123456, date_of_birth: Faker::Date.between(from: "1930-01-01", to: "2015-01-01"))
end

ligue1 = League.create(name: "La premier league")
team1 = Team.new(league: League.first)
team2 = Team.new(league: League.first)
game1 = Game.new(league: ligue1)


# team_user1 = TeamUser.new
# team_user1.user = User.all[0]
# team_user1.team = team1
# team_user1.save

# team_user2 = TeamUser.new
# team_user2.user = User.all[1]
# team_user2.team = team1
# team_user2.save

# team_user3 = TeamUser.new
# team_user3.user = User.all[2]
# team_user3.team = team2
# team_user3.save

# team_user4 = TeamUser.new
# team_user4.user = User.all[3]
# team_user4.team = team2
# team_user4.save

team1.first_player = User.all[0]
team1.second_player = User.all[1]
team1.league = ligue1
team1.save

team2.first_player = User.all[2]
team2.second_player = User.all[3]
team2.league = ligue1
team2.save

game1.first_team = team1
game1.second_team = team2
game1.league = ligue1
game1.save
