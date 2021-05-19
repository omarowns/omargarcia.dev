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

mx_profile = Profile.find_or_create_by(type: 'mx') do |profile|
  profile.name = 'Omar Garcia'
  profile.title = 'Eres mas valiente que Brodo'
  profile.animoji = '(∩｀-´)⊃━☆ﾟ.*･｡ﾟ'
  profile.save

  profile.sections.find_or_create_by(type: 'about_me') do |section|
    section.save

    section.translations.find_or_create_by(locale: 'es-MX') do |section_translation|
      section_translation.title = 'Hola!, soy Omar Garcia'
      section_translation.save
    end

    section.translations.find_or_create_by(locale: 'en') do |section_translation|
      section_translation.title = 'Hi!, my name is Omar Garcia'
      section_translation.save
    end
  end
end

dev_profile = Profile.find_or_create_by(type: 'dev') do |profile|
  profile.name = 'Omar Garcia'
  profile.title = 'Sr. Software Engineer'
  profile.animoji = '(∩｀-´)⊃━☆ﾟ.*･｡ﾟ 💎'
  profile.save
end
