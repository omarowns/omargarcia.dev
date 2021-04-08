class ProfileImage < ApplicationRecord
  belongs_to :profile
  belongs_to :image

  scope :main_image, -> { find_by(main: true) }
  scope :featured_image, -> { find_by(featured: true) }

  validates :main, uniqueness: { scope: :profile_id } # add_index :profile_images, [:main, :profile_id], unique: true
  validates :featured, uniqueness: { scope: :profile_id } # add_index :profile_images, [:featured, :profile_id], unique: true
  validates :position, uniqueness: { scope: :profile_id } # add_index :profile_images, [:position, :profile_id], unique: true
end
