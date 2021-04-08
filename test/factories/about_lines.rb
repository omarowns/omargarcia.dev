FactoryBot.define do
  factory :about_line do
    line { "Lorem Ipsum Dolor no se que" }
    sequence(:position) { |i| i }
    association :about
  end
end
