class Game < ApplicationRecord
  validates :team1, presence: true
  validates :team2, presence: true
  validates :team1score, presence: true
  validates :team2score, presence: true

  validate :team1_cannot_equal_team2

  def team1_cannot_equal_team2
    if team1 == team2
      errors.add(:team1, "team1 and team2 names cannot be the same.")
    end
  end
end
