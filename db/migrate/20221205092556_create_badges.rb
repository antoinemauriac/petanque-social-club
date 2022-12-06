class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :first_league_winner, null: false, default: false
      t.boolean :three_league_winner, null: false, default: false
      t.boolean :five_league_winner, null: false, default: false
      t.boolean :generation, null: false, default: false
      t.boolean :first_fanny, null: false, default: false
      t.boolean :three_fanny, null: false, default: false
      t.boolean :wood_ball, null: false, default: false
      t.boolean :silver_ball, null: false, default: false
      t.boolean :gold_ball, null: false, default: false
      t.boolean :fire_ball, null: false, default: false

      t.timestamps
    end
  end
end
