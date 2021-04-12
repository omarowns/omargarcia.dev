class AddActiveColumnToGroupTables < ActiveRecord::Migration[6.1]
  def change
    add_column :abouts, :active, :boolean, default: false
    add_column :work_groups, :active, :boolean, default: false
    add_column :interest_groups, :active, :boolean, default: false
    add_column :location_groups, :active, :boolean, default: false
  end
end
