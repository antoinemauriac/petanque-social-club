class AddReferencesToSelectedUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :selected_users, :user, foreign_key: true
  end
end
