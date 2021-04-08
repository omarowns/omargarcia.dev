FactoryBot.define do
  factory :profile do
    name { "Omar Garcia" }
    title { "Sr Software Engineer" }
    animoji { "(∩｀-´)⊃━☆ﾟ.*･｡ﾟ" }

    factory :profile_with_about do
      association :about
    end

    factory :profile_with_about_lines do
      association :about_with_about_lines
    end
  end
end
