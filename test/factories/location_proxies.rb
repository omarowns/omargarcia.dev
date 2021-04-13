FactoryBot.define do
  factory :location_proxy do
    sequence(:position) { |i| i }
    locatable { create :location_group }
    association :location
  end
end
