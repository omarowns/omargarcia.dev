class AddAdditionalToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :abouts, :additional, :string
    add_column :work_groups, :additional, :string
  end
end
