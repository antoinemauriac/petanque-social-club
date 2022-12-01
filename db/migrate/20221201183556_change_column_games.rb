class ChangeColumnGames < ActiveRecord::Migration[7.0]
  def change
    change_column_null :games, :status, :boolean, default: true
  end
end
