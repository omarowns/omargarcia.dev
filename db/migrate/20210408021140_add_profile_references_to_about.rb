class AddProfileReferencesToAbout < ActiveRecord::Migration[6.1]
  def change
    add_reference :abouts, :profile, null: false, foreign_key: true
  end
end
