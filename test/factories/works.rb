FactoryBot.define do
  factory :work do
    title { "Cratebind" }
    additional { "" }
    link { "https://www.cratebind.com" }
    duration { "Present" }
    image_pack_tag { "" }
    association :work_group
  end
end
