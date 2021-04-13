class ImageProxy < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :image, optional: true
end
