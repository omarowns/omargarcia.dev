class CreateAboutLines < ActiveRecord::Migration[6.1]
  def change
    create_table :about_lines do |t|
      t.string :line
      t.integer :position
      t.references :about, null: false, foreign_key: true

      t.timestamps
    end
  end
end
