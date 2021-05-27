# == Schema Information
#
# Table name: visits
#
#  id            :bigint           not null, primary key
#  address       :string
#  city          :string
#  country       :string
#  ip            :string
#  latitude      :string
#  longitude     :string
#  postal_code   :string
#  state         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  impression_id :bigint           not null
#
# Indexes
#
#  index_visits_on_impression_id  (impression_id)
#
# Foreign Keys
#
#  fk_rails_...  (impression_id => impressions.id)
#
FactoryBot.define do
  factory :visit do
    impression { nil }
    ip { "MyString" }
    city { "MyString" }
    region { "MyString" }
    country { "MyString" }
    latitude { "MyString" }
    longitude { "MyString" }
    postal { "MyString" }
  end
end
