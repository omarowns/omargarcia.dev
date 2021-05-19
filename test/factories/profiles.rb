# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  animoji    :string
#  name       :string
#  title      :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :profile do
    sequence(:type) { |i| i }
    name { "Omar Garcia" }
    title { "Sr Software Engineer" }
    animoji { "(∩｀-´)⊃━☆ﾟ.*･｡ﾟ" }
  end
end
