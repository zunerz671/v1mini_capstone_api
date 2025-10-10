class AddTeamRefsToGames < ActiveRecord::Migration[8.0]
  def change
    add_reference :games, :team1, foreign_key: { to_table: :teams }
    add_reference :games, :team2, foreign_key: { to_table: :teams }
  end
end
