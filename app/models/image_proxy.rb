class ImageProxy < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :image, optional: true

  scope :main, -> { where(main: true) }
  scope :featured, -> { where(featured: true) }
  scope :main_image, -> { find_by(main: true) }
  scope :featured_image, -> { find_by(featured: true) }

  validates :position, uniqueness: { scope: [:imageable_id, :imageable_type] }
  validates_uniqueness_of :main, scope: [:imageable_id, :imageable_type], conditions: -> { main }
  validates_uniqueness_of :featured, scope: [:imageable_id, :imageable_type], conditions: -> { featured }
end
