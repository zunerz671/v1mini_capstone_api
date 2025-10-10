# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# --- Teams ---
haggan  = Team.find_or_create_by!(name: "Haggan")  { |t| t.win = 0; t.loss = 0 }
heights = Team.find_or_create_by!(name: "Heights") { |t| t.win = 0; t.loss = 0 }
onra    = Team.find_or_create_by!(name: "Onra")    { |t| t.win = 0; t.loss = 0 }

# --- Games ---
# NOTE: use Team objects, not strings
Game.find_or_create_by!(team1: haggan,  team2: heights) { |g| g.team1score = 25; g.team2score = 20 }
Game.find_or_create_by!(team1: haggan,  team2: onra)    { |g| g.team1score = 19; g.team2score = 25 }
Game.find_or_create_by!(team1: heights, team2: onra)    { |g| g.team1score = 17; g.team2score = 25 }

# --- Users ---
User.find_or_create_by!(email: "user1@test.com") do |u|
  u.name = "user1"
  u.password = "123"
  u.password_confirmation = "123"
  u.role = "user"
end

User.find_or_create_by!(email: "admin1@test.com") do |u|
  u.name = "admin1"
  u.password = "123"
  u.password_confirmation = "123"
  u.role = "admin"
end
