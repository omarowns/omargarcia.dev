class Location < ApplicationRecord
  has_many :location_proxies

  include HasManyImageable
end
