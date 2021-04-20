# == Schema Information
#
# Table name: interest_groups
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE)
#  additional :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
#
# Indexes
#
#  index_interest_groups_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
FactoryBot.define do
  factory :interest_group do
    title { "Hobbies" }
    association :profile

    factory :interest_group_with_works do
      transient do
        interests_count { 5 }
      end

      after(:create) do |interest_group, evaluator|
        create_list(:interest, evaluator.interests_count, interest_group: interest_group)
        interest_group.reload
      end
    end
  end
end
