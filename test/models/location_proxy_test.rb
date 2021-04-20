# == Schema Information
#
# Table name: location_proxies
#
#  id             :bigint           not null, primary key
#  locatable_type :string           not null
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  locatable_id   :bigint           not null
#  location_id    :bigint           not null
#
# Indexes
#
#  index_location_proxies_on_locatable    (locatable_type,locatable_id)
#  index_location_proxies_on_location_id  (location_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#
require "test_helper"

class LocationProxyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
