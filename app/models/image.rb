class Image < ApplicationRecord
  has_many :profile_images, dependent: :nullify

  has_one_attached :file

  delegate :filename, to: :file, allow_nil: true
end
