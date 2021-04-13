class CreateLocationProxies < ActiveRecord::Migration[6.1]
  def change
    create_table :location_proxies do |t|
      t.integer :position
      t.references :locatable, polymorphic: true, null: false
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
