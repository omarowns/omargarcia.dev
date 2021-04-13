class Image < ApplicationRecord
  has_many :image_proxies, dependent: :nullify

  include HasManyLocatable

  has_one_attached :file

  delegate :filename, to: :file, allow_nil: true
end
