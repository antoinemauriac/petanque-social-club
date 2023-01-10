class RemoveNotNullConstraintOnLeagueIdInGames < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :games, :leagues
    change_column_null :games, :league_id, true
    add_foreign_key :games, :leagues, column: :league_id, on_delete: :nullify, name: 'fk_rails_c7a04448a4'
  end
end
