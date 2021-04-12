require 'active_support/concern'

module ActiveFromActivableRecord
  extend ActiveSupport::Concern

  included do
  end

  class_methods do
    def has_one_active(model)
      has_one model, -> { where(active: true) }
    end

    def has_many_active(model, through:, source: nil, inverse_of: nil)
      has_many "active_#{model}".to_sym,
               through: through,
               source: (source || model),
               inverse_of: (inverse_of || through || self.class.to_sym)
    end
  end
end
