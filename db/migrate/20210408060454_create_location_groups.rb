class CreateLocationGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :location_groups do |t|
      t.string :title
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
