# == Schema Information
#
# Table name: feature_flags
#
#  id          :bigint           not null, primary key
#  active      :boolean
#  description :string
#  key         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null

# Don't use this class directly for checking feature flags.
# Use Flags model which handles class level method to access this model data.
class FeatureFlag < ApplicationRecord
  validates :key, uniqueness: true
end
