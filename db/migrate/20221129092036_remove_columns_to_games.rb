class RemoveColumnsToGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :first_team
    remove_column :games, :second_team
  end
end
