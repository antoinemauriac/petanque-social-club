class ChangeColumnWinnerToLeague < ActiveRecord::Migration[7.0]
  def change
    rename_column :leagues, :team_winner_id, :league_winner
  end
end
