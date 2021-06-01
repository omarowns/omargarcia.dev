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
class JobLead < ApplicationRecord
end
