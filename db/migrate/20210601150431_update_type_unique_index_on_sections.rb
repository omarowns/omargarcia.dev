class UpdateTypeUniqueIndexOnSections < ActiveRecord::Migration[6.1]
  def up
    remove_index :sections, :type
    add_index :sections, [:type, :profile_id], unique: true
  end

  def down
    add_index :sections, :type, unique: true
  end
end
