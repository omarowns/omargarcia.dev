# == Schema Information
#
# Table name: feature_flags
#
#  id          :bigint           not null, primary key
#  active      :boolean
#  description :string
#  key         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :feature_flag do
    key { "MyString" }
    description { "MyString" }
    active { false }
  end
end
