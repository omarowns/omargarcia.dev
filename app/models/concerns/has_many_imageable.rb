require 'active_support/concern'

module HasManyImageable
  extend ActiveSupport::Concern

  included do
    scope :mains, -> { where(main: true) }
    scope :featureds, -> { where(featured: true) }
    scope :main, -> { find_by(main: true) }
    scope :featured, -> { find_by(featured: true) }

    has_many :image_proxies, as: :imageable, inverse_of: :imageable
    has_many :images, through: :image_proxies, source: :image, inverse_of: :image_proxies
  end

  class_methods do
  end
end
