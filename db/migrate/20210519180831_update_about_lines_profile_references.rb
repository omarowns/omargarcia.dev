class UpdateAboutLinesProfileReferences < ActiveRecord::Migration[6.1]
  def up
    add_reference :about_lines, :profile, null: true, foreign_key: true
    AboutLine.includes(:about).each do |al|
      al.update(profile_id: al.about.profile_id)
    end
    change_column_null :about_lines, :profile_id, true
  end

  def down
    remove_reference :about_lines, :profile
  end
end
