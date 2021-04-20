# == Schema Information
#
# Table name: location_proxies
#
#  id             :bigint           not null, primary key
#  locatable_type :string           not null
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  locatable_id   :bigint           not null
#  location_id    :bigint           not null
#
# Indexes
#
#  index_location_proxies_on_locatable    (locatable_type,locatable_id)
#  index_location_proxies_on_location_id  (location_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#
class LocationProxy < ApplicationRecord
  belongs_to :locatable, polymorphic: true
  belongs_to :location

  validates :position, uniqueness: { scope: [:locatable_id, :locatable_type] }

  delegate :value, to: :location, prefix: true, allow_nil: false
  delegate :polymorphic_title, to: :locatable, allow_nil: false
end
