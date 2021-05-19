class CreateSectionTranslations < ActiveRecord::Migration[6.1]
  def change
    create_table :section_translations do |t|
      t.references :section, null: false, foreign_key: true
      t.string :locale
      t.string :title

      t.timestamps
    end
  end
end
