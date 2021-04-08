class AddUniqueIndexOnProfileImages < ActiveRecord::Migration[6.1]
  def up
    add_index :profile_images, [:main, :profile_id], unique: true
    add_index :profile_images, [:featured, :profile_id], unique: true
    add_index :profile_images, [:position, :profile_id], unique: true
  end

  def down
    remove_index :profile_images, [:main, :profile_id], unique: true
    remove_index :profile_images, [:featured, :profile_id], unique: true
    remove_index :profile_images, [:position, :profile_id], unique: true
  end
end
