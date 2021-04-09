class RemoveNotNullFkOnProfileImages < ActiveRecord::Migration[6.1]
  def change
    change_table :profile_images do |t|
      t.remove_references :image
      t.references :image, null: true, foreign_key: true
    end
  end
end
