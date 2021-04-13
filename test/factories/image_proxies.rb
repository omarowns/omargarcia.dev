FactoryBot.define do
  factory :image_proxy do
    main { false }
    featured { false }
    position { 1 }
    imageable { create(:about) }
    association :image
  end
end
