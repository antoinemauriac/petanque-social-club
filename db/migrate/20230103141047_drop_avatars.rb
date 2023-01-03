class DropAvatars < ActiveRecord::Migration[7.0]
  def change
    drop_table :avatars
  end
end
