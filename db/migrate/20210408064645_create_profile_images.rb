class CreateProfileImages < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_images do |t|
      t.boolean :main
      t.boolean :featured
      t.integer :position
      t.references :profile, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
