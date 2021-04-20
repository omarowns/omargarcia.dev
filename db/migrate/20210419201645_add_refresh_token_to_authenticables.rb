class AddRefreshTokenToAuthenticables < ActiveRecord::Migration[6.1]
  def change
    add_column :authenticables, :refresh_token, :string
  end
end
