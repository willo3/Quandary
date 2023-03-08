puts "Cleaning db"
User.destroy_all
Game.destroy_all
GameSession.destroy_all
Scenario.destroy_all
Dilemma.destroy_all




puts "Creating users"
user1 = User.create(email: 'user1@example.com', password: 'password')
user2 = User.create(email: 'user2@example.com', password: 'password')
user3 = User.create(email: 'user3@example.com', password: 'password')


puts "Creating games"
game1 = Game.create(
  room_code: "123456",
  user: user1
  # changes for user_id
  # user_id: 1
)

game2 = Game.create(
  room_code: "123456",
  user: user2
  # changes for user_id
  # user_id: 2
)

puts "Creating game_sessions"
GameSession.create(
  avatar_url: 'https://res.cloudinary.com/drfmymoki/image/upload/v1678277429/Avatar_Cat_1_Hello_ovfbub.svg',
  game_id: 1,
  user_id: 1
)

GameSession.create(
  avatar_url: 'https://res.cloudinary.com/drfmymoki/image/upload/v1678277616/Avatar_Frog_1_Hello_kdqzz9.svg',
  game_id: 2,
  user_id: 2
)

GameSession.create(
  avatar_url: 'https://res.cloudinary.com/drfmymoki/image/upload/v1678277787/Avatar_Cat_2_Hello_b5gdo0.svg',
  game_id: 1,
  user_id: 3
)

puts "Creating scenario"
scenario1 = Scenario.create!(content: "Would you rather lose all of your money")
scenario2 = Scenario.create!(content: "Would rather lose all of your memories")
scenario3 = Scenario.create(content: "Would you rather eat a live octopus")
scenario4 = Scenario.create(content: "Would you rather lick a public toilet seat")
scenario5 = Scenario.create(content: "Would you rather have a unibrow")
scenario6 = Scenario.create(content: "Would you rather have a mullet")
scenario7 = Scenario.create(content: "Would you rather have rat tail")
scenario8 = Scenario.create(content: "Would you rather be able to shoot spaghetti out of your fingers")
scenario9 = Scenario.create(content: "Would you rather have cheese come out of your nose every time you sneeze")
scenario10 = Scenario.create(content: "Would you rather have the ability to communicate with plants but every time you do,
 you lose a day of your life")
scenario11 = Scenario.create(content: "Would you rather have the power to turn invisible but every time you do, you age a year")
scenario12 = Scenario.create(content: "Would you rather have a pet robot that always tells bad jokes")
scenario13 = Scenario.create(content: "Would you rather the power to fly but you have to wear a sombrero at all times")
scenario14 = Scenario.create(content: "Would you rather have the power to turn invisible but every time you do, you fart loudly")
scenario15 = Scenario.create(content: "Would you rather have a pet Bigfoot that's always stealing your socks")
scenario16 = Scenario.create(content: "Would you rather have a pet Loch Ness Monster that's always trying to sell you timeshares")
scenario17 = Scenario.create(content: "Would you rather have the ability to breathe underwater but only in a kiddie pool")
scenario18 = Scenario.create(content: "Would you rather have a spoonful of horseradish with every meal")
scenario19 = Scenario.create(content: "Would you rather have a plate of nachos with ghost peppers as the topping")
scenario20 = Scenario.create(content: "Would you rather have a unibutt")


puts "Creating dilemma"
dilemma1 = Dilemma.create!(
  game: game1,
  scenario1: scenario1,
  scenario2: scenario2
)


dilemma2 = Dilemma.create(
  scenario1: scenario2,
  scenario2: scenario18
)

dilemma3 = Dilemma.create(
  scenario1: scenario3,
  scenario2: scenario17
)

dilemma4 = Dilemma.create(
  scenario1: scenario4,
  scenario2: scenario16
)

dilemma5 = Dilemma.create(
  scenario1: scenario5,
  scenario2: scenario15
)

dilemma6 = Dilemma.create(
  scenario1: scenario6,
  scenario2: scenario14
)

dilemma7 = Dilemma.create(
  scenario1: scenario7,
  scenario2: scenario13
)

dilemma8 = Dilemma.create(
  scenario1: scenario8,
  scenario2: scenario12
)

dilemma9 = Dilemma.create(
  scenario1: scenario9,
  scenario2: scenario11
)

dilemma10 = Dilemma.create(
  scenario1: scenario10,
  scenario2: scenario20
)

puts "Done!"
