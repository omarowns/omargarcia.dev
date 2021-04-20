# == Schema Information
#
# Table name: work_groups
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
#  index_work_groups_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
FactoryBot.define do
  factory :work_group do
    title { "Experience" }
    association :profile

    factory :work_group_with_works do
      transient do
        works_count { 5 }
      end

      after(:create) do |work_group, evaluator|
        create_list(:work, evaluator.works_count, work_group: work_group)
        work_group.reload
      end
    end
  end
end
