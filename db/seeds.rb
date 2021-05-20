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

  profile.sections.find_or_create_by(type: 'intro') do |section|
    section.save

    section.translations.find_or_create_by(locale: 'es-MX') do |section_translation|
      section_translation.title = 'Intro'
      section_translation.content = """
        Soy un ingeniero de software viviendo en Aguascalientes, Mexico.

        Actualmente trabajo para <a href='https://www.cratebind.com' target='_blank'>CrateBind</a>, donde hago aplicaciones web (full-stack) usando Ruby on Rails.

        Soy titulado de Ingenieria en Sistemas Computacionales egresado de la <a href='https://www.uaa.mx/' target='_blank'>UAA</a>.

        En mi tiempo libre me gusta practicar escalada indoors, pasear en mi Onewheel, jugar videojuegos y aprender sobre diversos temas relacionados a astrofisica.
      """
      section_translation.save
    end

    section.translations.find_or_create_by(locale: 'en') do |section_translation|
      section_translation.title = 'Intro'
      section_translation.content = """
        I'm a software engineer living in Aguascalientes, Mexico.

        I currently work at <a href='https://www.cratebind.com' target='_blank'>CrateBind</a>, where I build web applications (full-stack) using Ruby on Rails.

        I got a degree in Computer Systems Engineering from <a href='https://www.uaa.mx/' target='_blank'>UAA</a>.

        In my spare time I like to practice indoor rock climbing, cruising on my Onewheel, playing videogames and learning about diverse subjects related to astrophisics.
      """
      section_translation.save
    end
  end

  profile.sections.find_or_create_by(type: '')
end

dev_profile = Profile.find_or_create_by(type: 'dev') do |profile|
  profile.name = 'Omar Garcia'
  profile.title = 'Sr. Software Engineer'
  profile.animoji = '(∩｀-´)⊃━☆ﾟ.*･｡ﾟ 💎'
  profile.save
end
