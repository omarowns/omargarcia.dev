class UpdateContactFromConversations < ActiveRecord::Migration[6.1]
  def up
    change_table :conversations do |t|
      t.remove_references :contact
      t.references :contact, polymorphic: true
    end
  end

  def down
    change_table :conversations do |t|
      t.remove_references :contact, polymorphic: true
      t.references :contact
    end
  end
end
