FactoryBot.define do
  factory :location_proxy do
    sequence(:position) { |i| i }
    parent { create :location_group }
    association :location
  end
end
