class Image < ApplicationRecord
  has_one_attached :file

  delegate :filename, to: :file, allow_nil: true
end
