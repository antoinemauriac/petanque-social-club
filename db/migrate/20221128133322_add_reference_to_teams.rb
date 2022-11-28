class AddReferenceToTeams < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :league, foreign_key: true
  end
end
