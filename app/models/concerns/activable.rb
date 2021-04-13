require 'active_support/concern'

module Activable
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(active: true) }

    def activate
      update(active: true)
    end

    def deactivate
      update(active: false)
    end

    def activate!
      update!(active: true)
    end

    def deactivate!
      update!(active: false)
    end
  end

  class_methods do
    def activable_for(foreign_key)
      validates_uniqueness_of :active, scope: foreign_key, conditions: -> { active }
    end
  end
end
