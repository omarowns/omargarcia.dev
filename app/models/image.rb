# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  alt        :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Image < ApplicationRecord
  has_many :image_proxies, dependent: :nullify

  has_one_attached :file

  include PolymorphicNameable

  delegate :filename, to: :file, allow_nil: true

  after_create :set_title, if: Proc.new { |image| image.title.blank? }
  after_create :set_alt, if: Proc.new { |image| image.alt.blank? }

  def polymorphic_title
    title
  end

  def to_s
    "#{id}: #{title}"
  end

  private

  def set_title
    update(title: filename)
  end

  def set_alt
    update(alt: filename)
  end
end
