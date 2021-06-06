class AddTypeToConversations < ActiveRecord::Migration[6.1]
  def change
    add_column :conversations, :type, :string
  end
end
