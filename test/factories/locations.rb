# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :location do
    value { "📍 Aguascalientes, MX" }
  end
end
