class Image < ApplicationRecord
  has_many :image_proxies, dependent: :nullify

  has_one_attached :file

  include PolymorphicNameable

  delegate :filename, to: :file, allow_nil: true

  def polymorphic_title
    filename
  end

  def to_s
    "#{id}: #{filename}"
  end
end
