class RenameProfilePositionToPositionOnInterest < ActiveRecord::Migration[6.1]
  def change
    rename_column :interests, :profile_position, :position
  end
end
