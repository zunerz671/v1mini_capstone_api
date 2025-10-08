class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :team1
      t.string :team2
      t.integer :team1score
      t.integer :team2score

      t.timestamps
    end
  end
end
