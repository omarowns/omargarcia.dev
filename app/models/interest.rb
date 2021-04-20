# == Schema Information
#
# Table name: interests
#
#  id                :bigint           not null, primary key
#  position          :integer
#  value             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  interest_group_id :bigint           not null
#
# Indexes
#
#  index_interests_on_interest_group_id  (interest_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (interest_group_id => interest_groups.id)
#
class Interest < ApplicationRecord
  belongs_to :interest_group
  has_one :profile, through: :interest_group
end
