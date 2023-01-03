class CreateProfilePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_pictures do |t|
      t.references :user, null: false, foreign_key: true
      t.references :avatar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
