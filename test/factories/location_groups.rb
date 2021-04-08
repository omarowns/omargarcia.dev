FactoryBot.define do
  factory :location_group do
    title { "Places lived" }
    association :profile
  end
end
