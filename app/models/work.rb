class Work < ApplicationRecord
  belongs_to :work_group
  has_one :profile, through: :work_group
  has_many :location_proxies, as: :parent
  has_many :locations, through: :location_proxy
end
