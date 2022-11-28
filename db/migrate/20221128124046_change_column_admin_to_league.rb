class ChangeColumnAdminToLeague < ActiveRecord::Migration[7.0]
  def change
    rename_column :leagues, :admin_user_id, :admin_user
  end
end
