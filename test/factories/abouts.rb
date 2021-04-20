# == Schema Information
#
# Table name: abouts
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
#  index_abouts_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
FactoryBot.define do
  factory :about do
    title { "About Me" }
    association :profile

    factory :about_with_about_lines do
      transient do
        about_lines_count { 5 }
      end

      after(:create) do |about, evaluator|
        create_list(:about_line, evaluator.about_lines_count, about: about)
        about.reload
      end
    end
  end
end
