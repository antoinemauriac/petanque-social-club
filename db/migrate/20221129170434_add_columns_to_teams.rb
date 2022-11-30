class AddColumnsToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :number_of_wins, :integer, default: 0
    add_column :teams, :points_for, :integer, default: 0
    add_column :teams, :points_against, :integer, default: 0
    add_column :teams, :games_played, :integer, default: 0
  end
end
