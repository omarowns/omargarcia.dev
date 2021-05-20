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

profile_picture = Image.create(title: 'Omar Garcia Profile Picture', alt: 'profile picture')
profile_picture.file.attach(io: File.open(Rails.root.join('test', 'fixtures', 'files', 'meee.jpeg')), filename: 'profile_pic.jpeg')

mx_profile = Profile.find_or_create_by(type: 'mx') do |profile|
  profile.name = 'Omar Garcia'
  profile.title = 'Sr. Software Engineer'
  profile.animoji = '(∩｀-´)⊃━☆ﾟ.*･｡ﾟ 💎'
  profile.save

  profile.image_proxies.create(image: profile_picture, main: true)

  intro_section = profile.sections.find_or_create_by(type: 'intro')

  es_translation = intro_section.translations.find_by(locale: 'es-MX')
  es_translation.title = 'Hola, soy Omar!'
  es_translation.content = """
    <p>Soy un ingeniero de software viviendo en Aguascalientes, Mexico.</p>
    <br>
    <p>Actualmente trabajo para <a href='https://www.cratebind.com' target='_blank'>CrateBind</a>, donde hago aplicaciones web (full-stack) usando Ruby on Rails.</p>
    <br>
    <p>Soy titulado de Ingenieria en Sistemas Computacionales egresado de la <a href='https://www.uaa.mx/' target='_blank'>UAA</a>.</p>
    <br>
    <p>En mi tiempo libre me gusta practicar escalada indoors, pasear en mi Onewheel, jugar videojuegos y aprender sobre diversos temas relacionados a astrofisica.</p>
  """
  es_translation.save

  en_translation = intro_section.translations.find_by(locale: 'en')
  en_translation.title = 'Hi, my name is Omar!'
  en_translation.content = """
    <p>I'm a software engineer living in Aguascalientes, Mexico.</p>
    <br>
    <p>I currently work at <a href='https://www.cratebind.com' target='_blank'>CrateBind</a>, where I build web applications (full-stack) using Ruby on Rails.</p>
    <br>
    <p>I got a degree in Computer Systems Engineering from <a href='https://www.uaa.mx/' target='_blank'>UAA</a>.</p>
    <br>
    <p>In my spare time I like to practice indoor rock climbing, cruising on my Onewheel, playing videogames and learning about diverse subjects related to astrophisics.</p>
  """
  en_translation.save

  about_section = profile.sections.find_or_create_by(type: 'about')
  about_es_translation = about_section.translations.find_by(locale: 'es-MX')
  about_es_translation.title = 'Acerca de mi'
  about_es_translation.content = "<h3>TBD</h3>"
  about_es_translation.save

  about_en_translation = about_section.translations.find_by(locale: 'en')
  about_en_translation.title = 'About me'
  about_en_translation.content = "<h3>TBD</h3>"
  about_en_translation.save
end
