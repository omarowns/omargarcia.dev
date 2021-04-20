# == Schema Information
#
# Table name: location_groups
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
#  index_location_groups_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
class LocationGroup < ApplicationRecord
  belongs_to :profile

  include HasManyImageable, HasManyLocatable, Activable, PolymorphicNameable

  activable_for :profile_id

  def polymorphic_title
    to_s
  end

  def to_s
    "#{id}: #{title}"
  end
end
