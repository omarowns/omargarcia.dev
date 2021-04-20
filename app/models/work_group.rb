# == Schema Information
#
# Table name: work_groups
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE)
#  additional :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
#
# Indexes
#
#  index_work_groups_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
class WorkGroup < ApplicationRecord
  belongs_to :profile
  has_many :works

  include HasManyImageable, Activable

  activable_for :profile_id

  def to_s
    "#{id}: #{title}"
  end
end
