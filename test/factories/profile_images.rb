FactoryBot.define do
  factory :profile_image do
    main { false }
    featured { false }
    sequence(:position) { |i| i }
    association :profile
    association :image
  end
end
