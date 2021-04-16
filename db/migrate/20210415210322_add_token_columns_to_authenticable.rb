class AddTokenColumnsToAuthenticable < ActiveRecord::Migration[6.1]
  def change
    add_column :authenticables, :token, :string
    add_column :authenticables, :token_secret, :string
  end
end
