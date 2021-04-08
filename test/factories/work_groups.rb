FactoryBot.define do
  factory :work_group do
    title { "Experience" }
    association :profile
  end
end
