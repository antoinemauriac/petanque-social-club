class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :league, null: false, foreign_key: true
      t.integer :first_team
      t.integer :second_team
      t.integer :score_first_team
      t.integer :score_second_team
      t.integer :game_winner
      t.boolean :status

      t.timestamps
    end
  end
end
