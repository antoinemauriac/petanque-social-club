class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatar_id, :bigint
  end
end
