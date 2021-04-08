class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :type
      t.string :name
      t.string :title
      t.string :animoji

      t.timestamps
    end
  end
end
