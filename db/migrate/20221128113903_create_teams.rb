class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.integer :first_player
      t.integer :second_player

      t.timestamps
    end
  end
end
