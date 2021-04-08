class ProfileImage < ApplicationRecord
  belongs_to :profile
  belongs_to :image

  scope :main, -> { where(main: true) }
  scope :featured, -> { where(featured: true) }
  scope :main_image, -> { find_by(main: true) }
  scope :featured_image, -> { find_by(featured: true) }

  validates :position, uniqueness: { scope: :profile_id } # add_index :profile_images, [:position, :profile_id], unique: true
  validates_uniqueness_of :main, scope: :profile_id, conditions: -> { main }
  validates_uniqueness_of :featured, scope: :profile_id, conditions: -> { featured }
end
