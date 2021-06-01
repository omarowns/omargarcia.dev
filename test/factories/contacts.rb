# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :contact do
    name { "MyString" }
    email { "MyString" }
  end
end
