# == Schema Information
#
# Table name: authenticables
#
#  id            :bigint           not null, primary key
#  provider      :string
#  refresh_token :string
#  token         :string
#  token_secret  :string
#  uid           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_authenticables_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :authenticable do
    user { nil }
    provider { "MyString" }
    uid { "MyString" }
  end
end
