# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Hard-code 2 teams

Team.create!(name: "Haggan", win: 0, loss: 0)
Team.create!(name: "Heights", win: 0, loss: 0)
Team.create!(name: "Isa", win: 0, loss: 0)

Game.create!(team1: "Haggan", team2: "Heights", team1score: 25, team2score: 20)
Game.create!(team1: "Haggan", team2: "Isa", team1score: 19, team2score: 25)
Game.create!(team1: "Heights", team2: "Isa", team1score: 25, team2score: 18)
