class BackfillGameTeamsIds < ActiveRecord::Migration[8.0]
  def up
    Game.reset_column_information
    Game.find_each do |g|
      t1 = Team.find_by!(name: g[:team1])
      t2 = Team.find_by!(name: g[:team2])
      g.update_columns(team1_id: t1.id, team2_id: t2.id)
    end
  end
end
