# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :image do
    file { Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'files', 'omaru.jpeg'), 'image/png') }
  end
end
