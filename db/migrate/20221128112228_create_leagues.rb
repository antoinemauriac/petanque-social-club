class CreateLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.boolean :status
      t.bigint :team_winner_id
      t.bigint :admin_user_id

      t.timestamps
    end
  end
end
