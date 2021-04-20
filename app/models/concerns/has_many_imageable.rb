require 'active_support/concern'

module HasManyImageable
  extend ActiveSupport::Concern

  included do
    # scope :main_image_proxies, -> { joins(:image_proxies).where(image_proxy: { main: true }) }
    # scope :featured_image_proxies, -> { joins(:image_proxies).where(image_proxy: { featured: true }) }
    # scope :main_image_proxy, -> { joins(:image_proxies).find_by(image_proxy: { main: true }) }
    # scope :featured_image_proxy, -> { joins(:image_proxies).find_by(image_proxy: { featured: true }) }

    has_many :image_proxies, as: :imageable, inverse_of: :imageable
    has_many :images, through: :image_proxies, source: :image, inverse_of: :image_proxies
  end

  class_methods do
  end

  def main_image
    image_proxies.main_image.image if image_proxies.main_image.present?
  end

  def featured_images
    ::Image.where(id: image_proxies.featured.pluck(:image_id))
  end

  def position_ordered_featured_images
    image_proxies.includes(:image).featured.position_ordered.map(&:image)
  end
end
