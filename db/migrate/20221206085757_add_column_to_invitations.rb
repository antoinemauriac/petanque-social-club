class AddColumnToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :confirmed, :boolean, default: true
  end
end
