puts "Cleaning db"
DilemmaScenario.destroy_all
Result.destroy_all
Player.destroy_all
User.destroy_all
Game.destroy_all
Scenario.destroy_all
Dilemma.destroy_all

puts "Creating users"
user1 = User.create(name: 'Marco', email: 'user1@example.com', password: 'password')
user2 = User.create(name: 'Zac', email: 'user2@example.com', password: 'password')
user3 = User.create(name: 'Nation', email: 'user3@example.com', password: 'password')

puts "Creating games"
game1 = Game.create(
  room_code: "ABCD",
  # changes for user_id
  # user_id: 1
)
game1.user = user1

game2 = Game.create(
  room_code: "EFGH",
  # changes for user_id
  # user_id: 2
)
game2.user = user2

puts "Creating players"
Player.create(
  avatar_url: 'https://res.cloudinary.com/drfmymoki/image/upload/v1678277429/Avatar_Cat_1_Hello_ovfbub.svg',
  game_id: 1,
  user_id: 1
)

Player.create(
  avatar_url: 'https://res.cloudinary.com/drfmymoki/image/upload/v1678277616/Avatar_Frog_1_Hello_kdqzz9.svg',
  game_id: 2,
  user_id: 2
)

Player.create(
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
scenario20 = Scenario.create(content: "Would you rather have a three foot nose")


puts "Creating dilemma"
dilemma1 = Dilemma.new
dilemma1.game = game1
dilemma1.save!
dilemma1.scenarios << scenario1
dilemma1.scenarios << scenario2


dilemma2 = Dilemma.new
dilemma2.game = game1
dilemma2.save!
dilemma2.scenarios << scenario3
dilemma2.scenarios << scenario4


dilemma3 = Dilemma.new
dilemma3.game = game1
dilemma3.save!
dilemma3.scenarios << scenario5
dilemma3.scenarios << scenario6


dilemma4 = Dilemma.new
dilemma4.game = game1
dilemma4.save!
dilemma4.scenarios << scenario7
dilemma4.scenarios << scenario8

dilemma5 = Dilemma.new
dilemma5.game = game1
dilemma5.save!
dilemma5.scenarios << scenario9
dilemma5.scenarios << scenario10

dilemma6 = Dilemma.new
dilemma6.game = game1
dilemma6.save!
dilemma6.scenarios << scenario11
dilemma6.scenarios << scenario12


dilemma7 = Dilemma.new
dilemma7.game = game1
dilemma7.save!
dilemma7.scenarios << scenario13
dilemma7.scenarios << scenario14


dilemma8 = Dilemma.new
dilemma8.game = game1
dilemma8.save!
dilemma8.scenarios << scenario15
dilemma8.scenarios << scenario16

dilemma9 = Dilemma.new
dilemma9.game = game1
dilemma9.save!
dilemma9.scenarios << scenario17
dilemma9.scenarios << scenario18


dilemma10 = Dilemma.new
dilemma10.game = game1
dilemma10.save!

dilemma10.scenarios << scenario19
dilemma10.scenarios << scenario20

puts "Done!"
