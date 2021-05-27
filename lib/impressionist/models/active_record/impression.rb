class Impression < ApplicationRecord

  include Impressionist::CounterCache

  # sets belongs_to and attr_accessible depending on Rails version
  Impressionist::SetupAssociation.new(self).set

  store :params
  after_save :impressionable_counter_cache_updatable?

  broadcasts inserts_by: :prepend
end
