class CreateInterestGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :interest_groups do |t|
      t.string :title
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
