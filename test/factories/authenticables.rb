FactoryBot.define do
  factory :authenticable do
    user { nil }
    provider { "MyString" }
    uid { "MyString" }
  end
end
