class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :title
      t.string :additional
      t.string :link
      t.string :duration
      t.string :image_pack_tag
      t.references :work_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
