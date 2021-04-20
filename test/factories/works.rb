# == Schema Information
#
# Table name: works
#
#  id             :bigint           not null, primary key
#  additional     :string
#  duration       :string
#  image_pack_tag :string
#  link           :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  work_group_id  :bigint           not null
#
# Indexes
#
#  index_works_on_work_group_id  (work_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (work_group_id => work_groups.id)
#
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
