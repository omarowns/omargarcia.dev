class AddTypeToSections < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :type, :string
    add_index :sections, :type, unique: true
  end
end
