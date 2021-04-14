FactoryBot.define do
  factory :interest do
    value { "Videogames" }
    position { 1 }
    association :interest_group
  end
end
