class CreateSelectedUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :selected_users do |t|
      t.references :league, null: false, foreign_key: true
      t.string :user_id

      t.timestamps
    end
  end
end
