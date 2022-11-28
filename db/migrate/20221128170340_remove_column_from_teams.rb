class RemoveColumnFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :first_player
    remove_column :teams, :second_player
  end
end
