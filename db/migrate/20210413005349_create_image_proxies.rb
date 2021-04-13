class CreateImageProxies < ActiveRecord::Migration[6.1]
  def change
    create_table :image_proxies do |t|
      t.boolean :main
      t.boolean :featured
      t.integer :position
      t.references :imageable, polymorphic: true, null: false
      t.references :image, null: true, foreign_key: true

      t.timestamps
    end
  end
end
