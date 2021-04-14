require 'active_support/concern'

module PolymorphicNameable
  extend ActiveSupport::Concern

  included do
    def polymorphic_title
      "#{self.class.to_s} #{self.id}"
    end
  end
end
