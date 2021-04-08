FactoryBot.define do
  factory :interest_group do
    title { "Hobbies" }
    association :profile
  end
end
