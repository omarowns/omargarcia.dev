# == Schema Information
#
# Table name: image_proxies
#
#  id             :bigint           not null, primary key
#  featured       :boolean
#  imageable_type :string           not null
#  main           :boolean
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  image_id       :bigint
#  imageable_id   :bigint           not null
#
# Indexes
#
#  index_image_proxies_on_image_id   (image_id)
#  index_image_proxies_on_imageable  (imageable_type,imageable_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#
require "test_helper"

class ImageProxyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
