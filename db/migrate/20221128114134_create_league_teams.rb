class CreateLeagueTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :league_teams do |t|
      t.references :league, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
