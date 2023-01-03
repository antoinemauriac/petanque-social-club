class RemoveColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :avatar_id
  end
end
