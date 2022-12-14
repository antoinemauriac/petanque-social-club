# require "open-uri"

puts "cleaning DB"

ProfilePicture.destroy_all
Avatar.destroy_all
Badge.destroy_all
Invitation.destroy_all
SelectedUser.destroy_all
Field.destroy_all
Message.destroy_all
TeamUser.destroy_all
SelectedPlayer.destroy_all
User.destroy_all
GameTeam.destroy_all
Team.destroy_all
Game.destroy_all
League.destroy_all


puts "creating Avatars"

avatars = []
(1..67).each do |i|
  avatar = Avatar.create(filename: "avatar#{i}.svg")
  avatars << avatar
end

# puts "creating Leagues"

  # league1 = League.create(name: "Sporting Club Familial")
  # league2 = League.create(name: "Ligue Des Copains")

# puts "creating Users"

users = []
  user1 = User.create(email: "titi@gmail.com", username: "Titi", password: "123123", date_of_birth: "1930-01-01")
  user2 = User.create(email: "toto@gmail.com", username: "Uncle Moh", password: "123123", date_of_birth: "2000-01-01")
  user3 = User.create(email: "tata@gmail.com", username: "Nina", password: "123123", date_of_birth: "1930-01-01")
  user4 = User.create(email: "bibi@gmail.com", username: "Maaaarc", password: "123123", date_of_birth: "1930-01-01")
  user5 = User.create(email: "tutu@gmail.com", username: "Cathydu13", password: "123123", date_of_birth: "1930-01-01")
  user6 = User.create(email: "tete@gmail.com", username: "Patoche", password: "123123", date_of_birth: "1930-01-01")
  user7 = User.create(email: "tyty@gmail.com", username: "Aline", password: "123123", date_of_birth: "1930-01-01")
  user8 = User.create(email: "trotro@gmail.com", username: "Lucienne", password: "123123", date_of_birth: "1930-01-01")
  user9 = User.create(email: "tratra@gmail.com", username: "Léo le minot", password: "123123", date_of_birth: "1930-01-01")
  user10 = User.create(email: "trytry@gmail.com", username: "Dwight S", password: "123123", date_of_birth: "1930-01-01")
  user11 = User.create(email: "tretre@gmail.com", username: "Hasnia", password: "123123", date_of_birth: "1930-01-01")
  user12 = User.create(email: "blabla@gmail.com", username: "Sophia", password: "123123", date_of_birth: "1930-01-01")
  user13 = User.create(email: "lyly@gmail.com", username: "Canto", password: "123123", date_of_birth: "1930-01-01")
  user14 = User.create(email: "lrolro@gmail.com", username: "La Machine", password: "123123", date_of_birth: "1930-01-01")
  user15= User.create(email: "lralra@gmail.com", username: "Le sécateur", password: "123123", date_of_birth: "1930-01-01")
  user16 = User.create(email: "lrylry@gmail.com", username: "Felipe", password: "123123", date_of_birth: "1930-01-01")
  user17 = User.create(email: "lrelre@gmail.com", username: "Mamad", password: "123123", date_of_birth: "1930-01-01")
  user18 = User.create(email: "tlatla@gmail.com", username: "Habibi", password: "123123", date_of_birth: "1930-01-01")
  user19 = User.create(email: "rere@gmail.com", username: "Tireur en bois", password: "123123", date_of_birth: "1930-01-01")
  user20 = User.create(email: "lala@gmail.com", username: "Inti la queen", password: "123123", date_of_birth: "1930-01-01")

  (0..19).each do |i|
    users.push(User.all[i])
  end

  # photo1 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991182/development/p%C3%A9tanque-social-club/avatar17_qtsqti.png')
  # photo2 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991182/development/p%C3%A9tanque-social-club/avatar13_fsnstx.png')
  # photo3 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991182/development/p%C3%A9tanque-social-club/avatar16_rrnegl.png')
  # photo4 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991182/development/p%C3%A9tanque-social-club/avatar15_rhbfga.png')
  # photo5 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991181/development/p%C3%A9tanque-social-club/avatar12_xtsruw.png')
  # photo6 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991181/development/p%C3%A9tanque-social-club/avatar1_fk25i8.png')
  # photo7 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991182/development/p%C3%A9tanque-social-club/avatar11_iqgvrx.png')
  # photo8 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991181/development/p%C3%A9tanque-social-club/avatar3_upsa1a.png')
  # photo9 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991181/development/p%C3%A9tanque-social-club/avatar14_lvvi2o.png')
  # photo10 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991181/development/p%C3%A9tanque-social-club/avatar8_ropll8.png')
  # photo11 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991181/development/p%C3%A9tanque-social-club/avatar9_qaofir.png')
  # photo12 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1669991181/development/p%C3%A9tanque-social-club/avatar4_fsv3rk.png')

  # photo13 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670423889/development/p%C3%A9tanque-social-club/new%20avatars/avatar28_rymzs5.png')
  # photo14 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670423889/development/p%C3%A9tanque-social-club/new%20avatars/avatar30_j1ykss.png')
  # photo15 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670423889/development/p%C3%A9tanque-social-club/new%20avatars/avatar27_zslrxn.png')
  # photo16 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670423889/development/p%C3%A9tanque-social-club/new%20avatars/avatar29_wcuf9a.png')
  # photo17 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670423889/development/p%C3%A9tanque-social-club/new%20avatars/avatar33_pilzlp.png')
  # photo18 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670423889/development/p%C3%A9tanque-social-club/new%20avatars/avatar26_qmk0tw.png')
  # photo19 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670423889/development/p%C3%A9tanque-social-club/new%20avatars/avatar32_qscnpf.png')
  # photo20 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670423889/development/p%C3%A9tanque-social-club/new%20avatars/avatar31_o1jg8m.png')


  #   user1.photo.attach(io: photo1, filename: 'avatar1.png', content_type: 'image/png')
  #   user2.photo.attach(io: photo2, filename: 'avatar2.png', content_type: 'image/png')
  #   user3.photo.attach(io: photo3, filename: 'avatar3.png', content_type: 'image/png')
  #   user4.photo.attach(io: photo4, filename: 'avatar4.png', content_type: 'image/png')
  #   user5.photo.attach(io: photo5, filename: 'avatar5.png', content_type: 'image/png')
  #   user6.photo.attach(io: photo6, filename: 'avatar6.png', content_type: 'image/png')
  #   user7.photo.attach(io: photo7, filename: 'avatar7.png', content_type: 'image/png')
  #   user8.photo.attach(io: photo8, filename: 'avatar8.png', content_type: 'image/png')
  #   user9.photo.attach(io: photo9, filename: 'avatar9.png', content_type: 'image/png')
  #   user10.photo.attach(io: photo10, filename: 'avatar10.png', content_type: 'image/png')
  #   user11.photo.attach(io: photo11, filename: 'avatar11.png', content_type: 'image/png')
  #   user12.photo.attach(io: photo12, filename: 'avatar12.png', content_type: 'image/png')
  #   user13.photo.attach(io: photo13, filename: 'avatar13.png', content_type: 'image/png')
  #   user14.photo.attach(io: photo14, filename: 'avatar14.png', content_type: 'image/png')
  #   user15.photo.attach(io: photo15, filename: 'avatar15.png', content_type: 'image/png')
  #   user16.photo.attach(io: photo16, filename: 'avatar16.png', content_type: 'image/png')
  #   user17.photo.attach(io: photo17, filename: 'avatar17.png', content_type: 'image/png')
  #   user18.photo.attach(io: photo18, filename: 'avatar18.png', content_type: 'image/png')
  #   user19.photo.attach(io: photo19, filename: 'avatar19.png', content_type: 'image/png')
  #   user20.photo.attach(io: photo20, filename: 'avatar20.png', content_type: 'image/png')

    # Badge.create!(user: user1)
    # Badge.create!(user: user2)
    # Badge.create!(user: user3)
    # Badge.create!(user: user4)
    # Badge.create!(user: user5)
    # Badge.create!(user: user6)
    # Badge.create!(user: user7)
    # Badge.create!(user: user8)
    # Badge.create!(user: user9)
    # Badge.create!(user: user10)
    # Badge.create!(user: user11)
    # Badge.create!(user: user12)
    # Badge.create!(user: user13)
    # Badge.create!(user: user14)
    # Badge.create!(user: user15)
    # Badge.create!(user: user16)
    # Badge.create!(user: user17)
    # Badge.create!(user: user18)
    # Badge.create!(user: user19)
    # Badge.create!(user: user20)

    (0..19).each do |i|
      User.all[i].profile_picture = ProfilePicture.create(avatar_id: avatars.sample.id, user_id: User.all[i])
    end


    # user20.save
    # user19.save
    # user18.save
    # user17.save
    # user16.save
    # user15.save
    # user14.save
    # user13.save
    # user12.save
    # user11.save
    # user10.save
    # user9.save
    # user8.save
    # user7.save
    # user6.save
    # user5.save
    # user4.save
    # user3.save
    # user2.save
    # user1.save

# puts "creating Games"

#   game1 = Game.create!(league: league1)
#   game2 = Game.create!(league: league1)
#   game3 = Game.create!(league: league1)
#   game4 = Game.create!(league: league1)
#   game5 = Game.create!(league: league1)
#   game6 = Game.create!(league: league1)
#   game7 = Game.create!(league: league1)
#   game8 = Game.create!(league: league1)
#   game9 = Game.create!(league: league1)
#   game10 = Game.create!(league: league1)

#   team1 = Team.create!(league: league1)
#   team2 = Team.create!(league: league1)
#   team3 = Team.create!(league: league1)
#   team4 = Team.create!(league: league1)
#   team5 = Team.create!(league: league1)

#   game11 = Game.create!(league: league2)
#   game12 = Game.create!(league: league2)
#   game13 = Game.create!(league: league2)
#   game14 = Game.create!(league: league2)
#   game15 = Game.create!(league: league2)
#   game16 = Game.create!(league: league2)
#   game17 = Game.create!(league: league2)
#   game18 = Game.create!(league: league2)
#   game19 = Game.create!(league: league2)
#   game20 = Game.create!(league: league2)

#   team6 = Team.create!(league: league2)
#   team7 = Team.create!(league: league2)
#   team8 = Team.create!(league: league2)
#   team9 = Team.create!(league: league2)
#   team10 = Team.create!(league: league2)


# puts "creating Teams"

#   TeamUser.create!(user: user1, team: team1)
#   TeamUser.create!(user: user2, team: team1)
#   TeamUser.create!(user: user3, team: team2)
#   TeamUser.create!(user: user4, team: team2)
#   TeamUser.create!(user: user5, team: team3)
#   TeamUser.create!(user: user6, team: team3)
#   TeamUser.create!(user: user7, team: team4)
#   TeamUser.create!(user: user8, team: team4)
#   TeamUser.create!(user: user9, team: team5)
#   TeamUser.create!(user: user10, team: team5)

#   GameTeam.create!(team: team1, game: game1)
#   GameTeam.create!(team: team2, game: game1)
#   GameTeam.create!(team: team1, game: game2)
#   GameTeam.create!(team: team3, game: game2)
#   GameTeam.create!(team: team1, game: game3)
#   GameTeam.create!(team: team4, game: game3)
#   GameTeam.create!(team: team1, game: game4)
#   GameTeam.create!(team: team5, game: game4)
#   GameTeam.create!(team: team2, game: game5)
#   GameTeam.create!(team: team3, game: game5)
#   GameTeam.create!(team: team2, game: game6)
#   GameTeam.create!(team: team4, game: game6)
#   GameTeam.create!(team: team2, game: game7)
#   GameTeam.create!(team: team5, game: game7)
#   GameTeam.create!(team: team3, game: game8)
#   GameTeam.create!(team: team4, game: game8)
#   GameTeam.create!(team: team3, game: game9)
#   GameTeam.create!(team: team5, game: game9)
#   GameTeam.create!(team: team4, game: game10)
#   GameTeam.create!(team: team5, game: game10)

#   TeamUser.create!(user: user1, team: team6)
#   TeamUser.create!(user: user3, team: team6)
#   TeamUser.create!(user: user6, team: team7)
#   TeamUser.create!(user: user9, team: team7)
#   TeamUser.create!(user: user2, team: team8)
#   TeamUser.create!(user: user5, team: team8)
#   TeamUser.create!(user: user7, team: team9)
#   TeamUser.create!(user: user8, team: team9)
#   TeamUser.create!(user: user4, team: team10)
#   TeamUser.create!(user: user10, team: team10)

#   GameTeam.create!(team: team6, game: game11)
#   GameTeam.create!(team: team7, game: game11)
#   GameTeam.create!(team: team6, game: game12)
#   GameTeam.create!(team: team8, game: game12)
#   GameTeam.create!(team: team6, game: game13)
#   GameTeam.create!(team: team9, game: game13)
#   GameTeam.create!(team: team6, game: game14)
#   GameTeam.create!(team: team10, game: game14)
#   GameTeam.create!(team: team7, game: game15)
#   GameTeam.create!(team: team8, game: game15)
#   GameTeam.create!(team: team7, game: game16)
#   GameTeam.create!(team: team9, game: game16)
#   GameTeam.create!(team: team7, game: game17)
#   GameTeam.create!(team: team10, game: game17)
#   GameTeam.create!(team: team8, game: game18)
#   GameTeam.create!(team: team9, game: game18)
#   GameTeam.create!(team: team8, game: game19)
#   GameTeam.create!(team: team10, game: game19)
#   GameTeam.create!(team: team9, game: game20)
#   GameTeam.create!(team: team10, game: game20)


# puts "creating Matchs & Scores"

#   #MATCH1 - LEAGUE 1

#     # game1.score_first_team = 13
#     # game1.score_second_team = rand(1..12)

#     # game1.game_winner = team1.id

#     # team1.points_for += game1.score_first_team
#     # team1.points_against += game1.score_second_team
#     # team1.games_played += 1
#     # team1.number_of_wins += 1

#     # team2.points_for += game1.score_second_team
#     # team2.points_against += game1.score_first_team
#     # team2.games_played += 1

#     # team1.save
#     # team2.save
#     # game1.status = true
#     # game1.save

#   #MATCH2

#     # game2.score_first_team = 13
#     # game2.score_second_team = rand(1..12)

#     # game2.game_winner = team1.id

#     # team1.points_for += game2.score_first_team
#     # team1.points_against += game2.score_second_team
#     # team1.games_played += 1
#     # team1.number_of_wins += 1

#     # team3.points_for += game2.score_second_team
#     # team3.points_against += game2.score_first_team
#     # team3.games_played += 1

#     # team1.save
#     # team3.save
#     # game2.status = true
#     # game2.save

#   #MATCH3

#     game3.score_first_team = 13
#     game3.score_second_team = rand(1..12)

#     game3.game_winner = team1.id

#     team1.points_for += game3.score_first_team
#     team1.points_against += game3.score_second_team
#     team1.games_played += 1
#     team1.number_of_wins += 1

#     team4.points_for += game3.score_second_team
#     team4.points_against += game3.score_first_team
#     team4.games_played += 1

#     team1.save
#     team4.save
#     game3.status = true
#     game3.save

#   #MATCH4

#     game4.score_first_team = 13
#     game4.score_second_team = rand(1..12)

#     game4.game_winner = team1.id

#     team1.points_for += game4.score_first_team
#     team1.points_against += game4.score_second_team
#     team1.games_played += 1
#     team1.number_of_wins += 1

#     team5.points_for += game4.score_second_team
#     team5.points_against += game4.score_first_team
#     team5.games_played += 1

#     team1.save
#     team5.save
#     game4.status = true
#     game4.save

#   #MATCH5

#     game5.score_first_team = 13
#     game5.score_second_team = rand(1..12)

#     game5.game_winner = team2.id

#     team2.points_for += game5.score_first_team
#     team2.points_against += game5.score_second_team
#     team2.games_played += 1
#     team2.number_of_wins += 1

#     team3.points_for += game5.score_second_team
#     team3.points_against += game5.score_first_team
#     team3.games_played += 1

#     team2.save
#     team3.save
#     game5.status = true
#     game5.save

#   #MATCH6

#     game6.score_first_team = 13
#     game6.score_second_team = rand(1..12)

#     game6.game_winner = team2.id

#     team2.points_for += game6.score_first_team
#     team2.points_against += game6.score_second_team
#     team2.games_played += 1
#     team2.number_of_wins += 1

#     team4.points_for += game6.score_second_team
#     team4.points_against += game6.score_first_team
#     team4.games_played += 1

#     team2.save
#     team4.save
#     game6.status = true
#     game6.save

#   #MATCH7

#     game7.score_first_team = 13
#     game7.score_second_team = rand(1..12)

#     game7.game_winner = team2.id

#     team2.points_for += game7.score_first_team
#     team2.points_against += game7.score_second_team
#     team2.games_played += 1
#     team2.number_of_wins += 1

#     team5.points_for += game7.score_second_team
#     team5.points_against += game7.score_first_team
#     team5.games_played += 1

#     team2.save
#     team5.save
#     game7.status = true
#     game7.save

#   #MATCH8

#     game8.score_first_team = 13
#     game8.score_second_team = rand(1..12)

#     game8.game_winner = team3.id

#     team3.points_for += game8.score_first_team
#     team3.points_against += game8.score_second_team
#     team3.games_played += 1
#     team3.number_of_wins += 1

#     team4.points_for += game8.score_second_team
#     team4.points_against += game8.score_first_team
#     team4.games_played += 1

#     team3.save
#     team4.save
#     game8.status = true
#     game8.save

#   #MATCH9

#     game9.score_first_team = 13
#     game9.score_second_team = rand(1..12)

#     game9.game_winner = team3.id

#     team3.points_for += game9.score_first_team
#     team3.points_against += game9.score_second_team
#     team3.games_played += 1
#     team3.number_of_wins += 1

#     team5.points_for += game9.score_second_team
#     team5.points_against += game9.score_first_team
#     team5.games_played += 1

#     team3.save
#     team5.save
#     game9.status = true
#     game9.save

#   #MATCH10

#     game10.score_first_team = 13
#     game10.score_second_team = rand(1..12)

#     game10.game_winner = team4.id

#     team4.points_for += game10.score_first_team
#     team4.points_against += game10.score_second_team
#     team4.games_played += 1
#     team4.number_of_wins += 1

#     team5.points_for += game10.score_second_team
#     team5.points_against += game10.score_first_team
#     team5.games_played += 1

#     team4.save
#     team5.save
#     game10.status = true
#     game10.save


# #MATCH11 - LEAGUE 2

#     # game11.score_first_team = 13
#     # game11.score_second_team = rand(1..12)

#     # game11.game_winner = team6.id

#     # team6.points_for += game11.score_first_team
#     # team6.points_against += game11.score_second_team
#     # team6.games_played += 1
#     # team6.number_of_wins += 1

#     # team7.points_for += game11.score_second_team
#     # team7.points_against += game11.score_first_team
#     # team7.games_played += 1

#     # team6.save
#     # team7.save
#     # game11.status = true
#     # game11.save

#   #MATCH12

#     # game12.score_first_team = 13
#     # game12.score_second_team = rand(1..12)

#     # game12.game_winner = team6.id

#     # team6.points_for += game12.score_first_team
#     # team6.points_against += game12.score_second_team
#     # team6.games_played += 1
#     # team6.number_of_wins += 1

#     # team8.points_for += game12.score_second_team
#     # team8.points_against += game12.score_first_team
#     # team8.games_played += 1

#     # team6.save
#     # team8.save
#     # game12.status = true
#     # game12.save

#   #MATCH13

#     # game13.score_first_team = 13
#     # game13.score_second_team = rand(1..12)

#     # game13.game_winner = team6.id

#     # team6.points_for += game13.score_first_team
#     # team6.points_against += game13.score_second_team
#     # team6.games_played += 1
#     # team6.number_of_wins += 1

#     # team9.points_for += game13.score_second_team
#     # team9.points_against += game13.score_first_team
#     # team9.games_played += 1

#     # team6.save
#     # team9.save
#     # game13.status = true
#     # game13.save

#   #MATCH14

#     game14.score_first_team = 13
#     game14.score_second_team = rand(1..12)

#     game14.game_winner = team6.id

#     team6.points_for += game14.score_first_team
#     team6.points_against += game14.score_second_team
#     team6.games_played += 1
#     team6.number_of_wins += 1

#     team10.points_for += game14.score_second_team
#     team10.points_against += game14.score_first_team
#     team10.games_played += 1

#     team6.save
#     team10.save
#     game14.status = true
#     game14.save

#   #MATCH15

#     game15.score_first_team = 13
#     game15.score_second_team = rand(1..12)

#     game15.game_winner = team7.id

#     team7.points_for += game15.score_first_team
#     team7.points_against += game15.score_second_team
#     team7.games_played += 1
#     team7.number_of_wins += 1

#     team8.points_for += game15.score_second_team
#     team8.points_against += game15.score_first_team
#     team8.games_played += 1

#     team7.save
#     team8.save
#     game15.status = true
#     game15.save

#   #MATCH16

#     game16.score_first_team = 13
#     game16.score_second_team = rand(1..12)

#     game16.game_winner = team7.id

#     team7.points_for += game16.score_first_team
#     team7.points_against += game16.score_second_team
#     team7.games_played += 1
#     team7.number_of_wins += 1

#     team9.points_for += game16.score_second_team
#     team9.points_against += game16.score_first_team
#     team9.games_played += 1

#     team7.save
#     team9.save
#     game16.status = true
#     game16.save

#   #MATCH17

#     game17.score_first_team = 13
#     game17.score_second_team = rand(1..12)

#     game17.game_winner = team7.id

#     team7.points_for += game17.score_first_team
#     team7.points_against += game17.score_second_team
#     team7.games_played += 1
#     team7.number_of_wins += 1

#     team10.points_for += game17.score_second_team
#     team10.points_against += game17.score_first_team
#     team10.games_played += 1

#     team7.save
#     team10.save
#     game17.status = true
#     game17.save

#   #MATCH18

#     game18.score_first_team = 13
#     game18.score_second_team = rand(1..12)

#     game18.game_winner = team8.id

#     team8.points_for += game18.score_first_team
#     team8.points_against += game18.score_second_team
#     team8.games_played += 1
#     team8.number_of_wins += 1

#     team9.points_for += game18.score_second_team
#     team9.points_against += game18.score_first_team
#     team9.games_played += 1

#     team8.save
#     team9.save
#     game18.status = true
#     game18.save

#   #MATCH19

#     game19.score_first_team = 13
#     game19.score_second_team = rand(1..12)

#     game19.game_winner = team8.id

#     team8.points_for += game19.score_first_team
#     team8.points_against += game19.score_second_team
#     team8.games_played += 1
#     team8.number_of_wins += 1

#     team10.points_for += game19.score_second_team
#     team10.points_against += game19.score_first_team
#     team10.games_played += 1

#     team8.save
#     team10.save
#     game19.status = true
#     game19.save

#   #MATCH20

#     game20.score_first_team = 13
#     game20.score_second_team = rand(1..12)

#     game20.game_winner = team9.id

#     team9.points_for += game20.score_first_team
#     team9.points_against += game20.score_second_team
#     team9.games_played += 1
#     team9.number_of_wins += 1

#     team10.points_for += game20.score_second_team
#     team10.points_against += game20.score_first_team
#     team10.games_played += 1

#     team9.save
#     team10.save
#     game20.status = true
#     game20.save

#     puts "creating Fields"

#     field19 = Field.create(name: "U Corsinu", address: "60 rue de l'archipel, 20000 Ajaccio", rating: 2)
#     photo19 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670338693/development/p%C3%A9tanque-social-club/terrains/terrain4_kafmns.jpg')
#     field19.photos.attach(io: photo19, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
#     field19.save

#     field14 = Field.create(name: "La boule du Lac", address: "13 Av. du Lac Marion, 64200 Biarritz", rating: 2)
#     photo14 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670338693/development/p%C3%A9tanque-social-club/terrains/terrain6_eyyio1.jpg')
#     field14.photos.attach(io: photo14, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
#     field14.save

#     field1 = Field.create(name: "Le Robert Shuman", address: "Av. Robert Schuman, 13002 Marseille", rating: 3)
#     photo1 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670338694/development/p%C3%A9tanque-social-club/terrains/terrain2_ei8q5c.jpg')
#     field1.photos.attach(io: photo1, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
#     field1.save

#     field2 = Field.create(name: "Monte cristo du bonheur", address: "50 Rue Monte Cristo, 13005 Marseille", rating: 2)
#     photo2 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670338693/development/p%C3%A9tanque-social-club/terrains/terrain7_corl79.png')
#     field2.photos.attach(io: photo2, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
#     field2.save

#     field3 = Field.create(name: "La boule d'Héléne", address: "5 Rue de Ste Hélène, 75013 Paris", rating: 5)
#     photo3 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670338694/development/p%C3%A9tanque-social-club/terrains/terrain11_gvgti4.jpg')
#     field3.photos.attach(io: photo3, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
#     field3.save



#     field15 = Field.create(name: "Le terrain du quai", address: "13 Quai des Belges, 67000 Strasbourg", rating: 2)
#     photo15 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670338694/development/p%C3%A9tanque-social-club/terrains/terrain9_o9mgkz.jpg')
#     field15.photos.attach(io: photo15, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
#     field15.save

#     field17 = Field.create(name: "Club Héraultais", address: "Rue du Progrès, 34000 Montpellier", rating: 2)
#     photo17 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670338694/development/p%C3%A9tanque-social-club/terrains/terrain10_dsjsso.jpg')
#     field17.photos.attach(io: photo17, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
#     field17.save

#     field18 = Field.create(name: "Le terrain de la gare", address: "All. du Chemin de Fer, 69006 Lyon", rating: 2)
#     photo18 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670338693/development/p%C3%A9tanque-social-club/terrains/terrain3_zluqdz.jpg')
#     field18.photos.attach(io: photo18, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
#     field18.save


#     field6 = Field.create(name: "Du luxe en boule", address: "Parc du 26ème Centenaire, 13010 Marseille", rating: 2)
#     photo6 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670338693/development/p%C3%A9tanque-social-club/terrains/terrain5_orh1v2.jpg')
#     field6.photos.attach(io: photo6, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
#     field6.save

#     field7 = Field.create(name: "Chez Dédé", address: "Av. de la Pointe Rouge, 13008 Marseille", rating: 4)
#     photo7 = URI.open('https://res.cloudinary.com/dushuxqmj/image/upload/v1670338693/development/p%C3%A9tanque-social-club/terrains/terrain8_jbeagl.jpg')
#     field7.photos.attach(io: photo7, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
#     field7.save
    # field8 = Field.create(name: "luxe en boulle", address: "1 Av. Beau Pin, 13008 Marseille", rating: 2)
    # photo8 = File.open('app/assets/images/terrain1.jpeg')
    # field8.photos.attach(io: photo8, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
    # field8.save

    # field4 = Field.create(name: "Terrain bonne humeur", address: "19 Rte des Fortifications, 75012 Paris", rating: 2)
    # photo4 = File.open('app/assets/images/terrain1.jpeg')
    # field4.photos.attach(io: photo4, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
    # field4.save

    # field5 = Field.create(name: "luxe en boulle", address: "19 Rte des Fortifications, 75012 Paris", rating: 2)
    # photo5 = File.open('app/assets/images/terrain1.jpeg')
    # field5.photos.attach(io: photo5, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
    # field5.save

    # field9 = Field.create(name: "luxe en boulle", address: "Parc du 26ème Centenaire, 13010 Marseille", rating: 2)
    # photo9 = File.open('app/assets/images/terrain1.jpeg')
    # field9.photos.attach(io: photo9, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
    # field9.save

    # field10 = Field.create(name: "luxe en boulle", address: "26 Rue d'Hozier, 13002 Marseille", rating: 2)
    # photo10 = File.open('app/assets/images/terrain1.jpeg')
    # field10.photos.attach(io: photo10, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
    # field10.save

    # field11 = Field.create(name: "luxe en boulle", address: "Bd Sakakini, 13004 Marseille", rating: 2)
    # photo11 = File.open('app/assets/images/terrain1.jpeg')
    # field11.photos.attach(io: photo11, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
    # field11.save

    # field12 = Field.create(name: "Montolivet", address: "394 Av. de Montolivet, 13012 Marseille", rating: 2)
    # photo12 = File.open('app/assets/images/terrain1.jpeg')
    # field12.photos.attach(io: photo12, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
    # field12.save

    # field13 = Field.create(name: "castellane en feu", address: "4 Av. de Corinthe, 13006 Marseille", rating: 2)
    # photo13 = File.open('app/assets/images/terrain1.jpeg')
    # field13.photos.attach(io: photo13, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
    # field13.save

    # field16 = Field.create(name: "castellane en feu", address: "13 Quai des Belges, 67000 Strasbourg", rating: 2)
    # photo16 = File.open('app/assets/images/terrain1.jpeg')
    # field16.photos.attach(io: photo16, filename: 'terrain1.jpeg', content_type: 'image/jpeg')
    # field16.save


    puts "Seeds OK"












  # p Game.all[0].score_first_team


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

# Team.where(league: league1)



#renvoie UNE team donnée d'une ligue donnée

# Team.where(league: league1).find(Team.all[3].id)

#renvoie tous les players d'une ligue donnée

# Team.where(league: league1).map { |team| TeamUser.where(team: team).map { |t| t.user }}.flatten


# teams_game_array  = GameTeam.where(game: game1).map { |gt| TeamUser.where(team: gt.team)}
# game_players = teams_game_array.map { |t| t.map { |u| u.user.username} }
# p game_players
