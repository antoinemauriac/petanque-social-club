class RemoveColumnToSelectedUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :selected_users, :user_id
  end
end
