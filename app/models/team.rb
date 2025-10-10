class Team < ApplicationRecord
  has_many :home_games, class_name: "Game", foreign_key: "team1_id"
  has_many :away_games, class_name: "Game", foreign_key: "team2_id"

  validates :name, presence: true
  validates :name, uniqueness: true
end
