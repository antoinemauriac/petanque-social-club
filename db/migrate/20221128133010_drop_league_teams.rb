class DropLeagueTeams < ActiveRecord::Migration[7.0]
  def change
    drop_table :league_teams
  end
end
