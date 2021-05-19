# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

main_user = User.new(
  email: 'omarowns@protonmail.com',
  password: Rails.application.credentials[:main_user_temp_password],
  password_confirmation: Rails.application.credentials[:main_user_temp_password]
)
main_user.save

mx_profile = Profile.find_or_create_by(type: 'MX') do |profile|
  profile.name = 'Omar Garcia'
  profile.title = 'Eres mas valiente que Brodo'
  profile.animoji = '(∩｀-´)⊃━☆ﾟ.*･｡ﾟ'
  profile.save
end

dev_profile = Profile.find_or_create_by(type: 'DEV') do |profile|
  profile.name = 'Omar Garcia'
  profile.title = 'Sr. Software Engineer'
  profile.animoji = '(∩｀-´)⊃━☆ﾟ.*･｡ﾟ 💎'
  profile.save
end
