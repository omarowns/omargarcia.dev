FactoryBot.define do
  factory :about do
    title { "About Me" }
    association :profile

    factory :about_with_about_lines do
      transient do
        about_lines_count { 5 }
      end

      after(:create) do |about, evaluator|
        create_list(:about_line, evaluator.about_lines_count, about: about)
        about.reload
      end
    end
  end
end
