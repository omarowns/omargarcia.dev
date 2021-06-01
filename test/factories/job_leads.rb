# == Schema Information
#
# Table name: job_leads
#
#  id         :bigint           not null, primary key
#  from       :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :job_lead do
    from { "MyString" }
    subject { "MyString" }
  end
end
