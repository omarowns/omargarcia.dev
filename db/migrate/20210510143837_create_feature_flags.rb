class CreateFeatureFlags < ActiveRecord::Migration[6.1]
  def change
    create_table :feature_flags do |t|
      t.string :key
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
