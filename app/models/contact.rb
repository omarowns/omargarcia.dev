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
class Contact < ApplicationRecord
  has_many :posts, as: :author, inverse_of: :author
  has_many :conversations
end
