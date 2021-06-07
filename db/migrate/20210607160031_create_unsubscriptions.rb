class CreateUnsubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :unsubscriptions do |t|
      t.references :conversation, null: false, foreign_key: true
      t.references :author, polymorphic: true, null: false

      t.timestamps
    end
  end
end
