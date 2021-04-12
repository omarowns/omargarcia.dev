class AddAdditionalToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :abouts, :additional, :string
    add_column :interest_groups, :additional, :string
    add_column :work_groups, :additional, :string
    add_column :location_groups, :additional, :string
  end
end
