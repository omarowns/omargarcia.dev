class LocationProxy < ApplicationRecord
  belongs_to :locatable, polymorphic: true
  belongs_to :location

  validates :position, uniqueness: { scope: [:locatable_id, :locatable_type] }

  delegate :value, to: :location, prefix: true, allow_nil: false
  delegate :polymorphic_title, to: :locatable, allow_nil: false
end
