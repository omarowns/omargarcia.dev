FactoryBot.define do
  factory :interest do
    value { "Videogames" }
    profile_position { 1 }
    association :interest_group
  end
end
