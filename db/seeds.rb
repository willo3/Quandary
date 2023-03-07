# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create some test users
User.create(email: 'user1@example.com', password: 'password')
User.create(email: 'user2@example.com', password: 'password')
User.create(email: 'user3@example.com', password: 'password')

require 'httparty'

response = HTTParty.get('https://api.dilemmerama.net/api/v1/scenarios')
scenarios = response.parsed_response

scenarios.first(20).each do |scenario|
  Scenario.create(title: scenario['title'], body: scenario['body'])
end
