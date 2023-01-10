class AddDefaultToLeagueIdInGames < ActiveRecord::Migration[7.0]
  def change
    change_column_null :games, :league_id, false, 0
  end
end
