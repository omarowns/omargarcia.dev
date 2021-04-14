FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }

    transient do
      pass { Faker::Alphanumeric.alphanumeric(number: 10) }
    end

    after :build do |user, transients|
      user.password = transients.pass
      user.password_confirmation = transients.pass
    end
  end
end
