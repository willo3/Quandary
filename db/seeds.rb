# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create(email: 'user1@example.com', password: 'password')
User.create(email: 'user2@example.com', password: 'password')
User.create(email: 'user3@example.com', password: 'password')

GameSession.create(
  avatar_url: 'https://www.w3schools.com/howto/img_avatar2.png',
  game_id: 1,
  user_id: 1
)

GameSession.create(
  avatar_url: 'https://www.w3schools.com/w3images/avatar5.png',
  game_id: 2,
  user_id: 2
)

GameSession.create(
  avatar_url: 'https://www.w3schools.com/w3images/avatar6.png',
  game_id: 3,
  user_id: 3
)

# game creation
# game = Game.create(room_code: "ABC123", user_id: 1)
# game.save
