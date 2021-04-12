class AboutLine < ApplicationRecord
  belongs_to :about
  has_one :profile, through: :about
end
