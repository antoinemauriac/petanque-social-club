class CreateFields < ActiveRecord::Migration[7.0]
  def change
    create_table :fields do |t|
      t.string :name
      t.text :address
      t.integer :rating

      t.timestamps
    end
  end
end
