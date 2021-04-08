FactoryBot.define do
  factory :image do
    file { Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'files', 'omaru.jpeg'), 'image/png') }
  end
end
