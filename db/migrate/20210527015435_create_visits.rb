class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.references :impression, null: false, foreign_key: true
      t.string :ip
      t.string :country
      t.string :state
      t.string :city
      t.string :postal_code
      t.string :address
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
