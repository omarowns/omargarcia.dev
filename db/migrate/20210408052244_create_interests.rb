class CreateInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :interests do |t|
      t.string :value
      t.integer :profile_position
      t.references :interest_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
