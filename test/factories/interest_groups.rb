FactoryBot.define do
  factory :interest_group do
    title { "Hobbies" }
    association :profile

    factory :interest_group_with_works do
      transient do
        interests_count { 5 }
      end

      after(:create) do |interest_group, evaluator|
        create_list(:interest, evaluator.interests_count, interest_group: interest_group)
        interest_group.reload
      end
    end
  end
end
