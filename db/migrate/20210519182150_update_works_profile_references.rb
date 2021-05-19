class UpdateWorksProfileReferences < ActiveRecord::Migration[6.1]
  def up
    add_reference :works, :profile, null: true, foreign_key: true
    Work.includes(:work_group).each do |work|
      work.update(profile_id: work.work_group.profile_id)
    end
    change_column_null :works, :profile_id, true
  end

  def down
    remove_reference :works, :profile
  end
end
