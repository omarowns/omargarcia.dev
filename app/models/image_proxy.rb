# == Schema Information
#
# Table name: image_proxies
#
#  id             :bigint           not null, primary key
#  featured       :boolean
#  imageable_type :string           not null
#  main           :boolean
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  image_id       :bigint
#  imageable_id   :bigint           not null
#
# Indexes
#
#  index_image_proxies_on_image_id   (image_id)
#  index_image_proxies_on_imageable  (imageable_type,imageable_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#
class ImageProxy < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :image, optional: true

  scope :main, -> { where(main: true) }
  scope :featured, -> { where(featured: true) }
  scope :main_image, -> { find_by(main: true) }
  scope :position_ordered, -> { order(:position) }
  # scope :featured_image, -> { find_by(featured: true) }

  validates :position, uniqueness: { scope: [:imageable_id, :imageable_type] }
  validates_uniqueness_of :main, scope: [:imageable_id, :imageable_type], conditions: -> { main }
  # validates_uniqueness_of :featured, scope: [:imageable_id, :imageable_type], conditions: -> { featured }

  include PolymorphicNameable

  delegate :filename, :title, :alt, to: :image, prefix: true, allow_nil: false
  delegate :polymorphic_title, to: :imageable, allow_nil: false
end
