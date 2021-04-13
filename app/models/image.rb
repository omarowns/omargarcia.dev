class Image < ApplicationRecord
  has_many :image_proxies, dependent: :nullify
  has_many :profile_images, dependent: :nullify

  include HasManyLocatable

  has_one_attached :file

  delegate :filename, to: :file, allow_nil: true
end
