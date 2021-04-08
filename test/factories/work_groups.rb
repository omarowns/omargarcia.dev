FactoryBot.define do
  factory :work_group do
    title { "Experience" }
    association :profile

    factory :work_group_with_works do
      transient do
        works_count { 5 }
      end

      after(:create) do |work_group, evaluator|
        create_list(:work, evaluator.works_count, work_group: work_group)
        work_group.reload
      end
    end
  end
end
