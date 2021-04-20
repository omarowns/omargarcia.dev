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

rmt_loc = Location.find_or_create_by(value: '🌐 Remote')
gdl_loc = Location.find_or_create_by(value: '📍 Guadalajara, 🇲🇽')
ags_loc = Location.find_or_create_by(value: '📍 Aguascalientes, 🇲🇽')
col_loc = Location.find_or_create_by(value: '📍 Colima, 🇲🇽')
slp_loc = Location.find_or_create_by(value: '📍 San Luis Potosi, 🇲🇽')
ore_loc = Location.find_or_create_by(value: '📍 Oregon, 🇺🇸')
jpn_loc = Location.find_or_create_by(value: '✈️ Osaka/Tokyo, 🇯🇵')
jpn_loc = Location.find_or_create_by(value: '✈️ ATL/CAL/DFW/NYC/ORE/SEA/UT, 🇺🇸')

mx_profile = Profile.find_or_create_by(type: 'MX') do |profile|
  profile.name = 'Omar Garcia'
  profile.title = 'Eres mas valiente que Brodo'
  profile.animoji = '(∩｀-´)⊃━☆ﾟ.*･｡ﾟ'
  profile.save

  profile.abouts.find_or_create_by(title: 'Acerca de mi') do |about|
    about.active = true
    about.save

    about.about_lines.find_or_create_by(line: 'Hola! Soy un desarrollador web viviendo y trabajando remotamente desde Aguascalientes, México 📍')
    about.about_lines.find_or_create_by(line: 'Fuera del trabajo me gusta entrenar bouldering o escalada deportiva, pasear en mi Onewheel, leer temas interesantes sobre astronomía y jugar videojuegos.')
  end

  profile.interest_groups.find_or_create_by(title: 'Entre mis intereses también están:') do |ig|
    ig.active = true
    ig.save

    ig.interests.find_or_create_by(value: '⌚ Horología')
    ig.interests.find_or_create_by(value: '📚 Anime y manga')
    ig.interests.find_or_create_by(value: '🛩️ Viajar <abbr title="pre CoVID">*</abbr>')
    ig.interests.find_or_create_by(value: '🧗‍♂️ Bouldering/Escalada Deportiva')
    ig.interests.find_or_create_by(value: '🪐 Astronomía')
    ig.interests.find_or_create_by(value: '👾 Videojuegos (FPS)')
    ig.interests.find_or_create_by(value: '🎵 Conciertos de Prog/Power Metal')
    ig.interests.find_or_create_by(value: '🎲 Escuchar podcasts de DnD')
  end

  profile.work_groups.find_or_create_by(title: 'Trabajo') do |work_group|
    work_group.active = true
    work_group.save

    work_group.additional = 'Actualmente trabajo como desarrollador de Ruby on Rails para CrateBind, una agencia de productos digitales basada en Dallas, TX.'

    work_group.works.find_or_create_by(title: 'Cratebind') do |work|
      work.link = 'https://www.cratebind.com'
      work.duration = 'Oct 2018 - Present'
      work.image_pack_tag = 'svg/cratebind.svg'
      work.save

      work.location_proxies.create(location: gdl_loc)
      work.location_proxies.create(location: rmt_loc)
    end
  end

  profile.location_groups.find_or_create_by(title: 'Lugares donde he vivido') do |location_group|
    location_group.active = true
    location_group.additional = 'Aparte de mi actual ciudad de residencia también he vivido en:'
    location_group.save

    location_group.location_proxies.create(location: ore_loc)
    location_group.location_proxies.create(location: col_loc)
    location_group.location_proxies.create(location: gdl_loc)
  end
end

dev_profile = Profile.find_or_create_by(type: 'DEV') do |profile|
  profile.name = 'Omar Garcia'
  profile.title = 'Sr. Software Engineer'
  profile.animoji = '(∩｀-´)⊃━☆ﾟ.*･｡ﾟ 💎'
  profile.save


  profile.abouts.find_or_create_by(title: 'About Me') do |about|
    about.active = true
    about.save

    about.about_lines.find_or_create_by(line: "Heylo! I'm Ruby on Rails developer working at CrateBind, a Dallas-based digital product agency.")
    about.about_lines.find_or_create_by(line: "I started my profesional career on 2013 whilst studying to get my degree in Computer Systems Enginnering (graduated 2015).")
    about.about_lines.find_or_create_by(line: "Developing strong and well-founded backend architectures from database design to infrastructure implementation is my jam.")
    about.about_lines.find_or_create_by(line: "I love computers and everything related to them ♥️")
    about.about_lines.find_or_create_by(line: "Outside of work I like to practice rock climbing/bouldering, riding my Onewheel, reading interesting topics on astronomy and playing videogames.")
  end

  profile.work_groups.find_or_create_by(title: 'Experience') do |work_group|
    work_group.active = true
    work_group.save

    work_group.works.find_or_create_by(title: 'Cratebind') do |work|
      work.link = 'https://www.cratebind.com'
      work.duration = 'Oct 2018 - Present'
      work.image_pack_tag = 'svg/cratebind.svg'
      work.save

      work.location_proxies.create(location: gdl_loc)
      work.location_proxies.create(location: rmt_loc)
    end

    work_group.works.find_or_create_by(title: 'MagmaLabs') do |work|
      work.link = 'https://www.magmalabs.io'
      work.duration = 'Mar 2016 - Oct 2018'
      work.image_pack_tag = 'svg/magmalabs-min.svg'
      work.save

      work.location_proxies.create(location: gdl_loc)
      work.location_proxies.create(location: rmt_loc)
    end

    work_group.works.find_or_create_by(title: 'AgencyMVP') do |work|
      work.link = 'https://www.agencymvp.com'
      work.duration = 'Jul 2016 - Sep 2017'
      work.image_pack_tag = 'agency_mvp.png'
      work.save

      work.location_proxies.create(location: rmt_loc)
    end
  end

  profile.location_groups.find_or_create_by(title: 'Location') do |location_group|
    location_group.additional = 'Currently residing in Aguascalientes, Mexico 🏠'
    location_group.active = true
    location_group.save
  end

  profile.interest_groups.find_or_create_by(title: 'Other interests and hobbies include but not limited to:') do |ig|
    ig.active = true
    ig.save

    ig.interests.find_or_create_by(value: "⌚ Horology")
    ig.interests.find_or_create_by(value: "📚 Anime and manga")
    ig.interests.find_or_create_by(value: "🛩️ Travelling <abbr title='pre-CoVID'>*</abbr>")
    ig.interests.find_or_create_by(value: "🎵 Lo-Fi/CityPop/Synthwave/Hip-Hop/Metal Music")
    ig.interests.find_or_create_by(value: "🧗‍♂️ Bouldering/Sports Climbing")
    ig.interests.find_or_create_by(value: "🪐 Astronomy")
    ig.interests.find_or_create_by(value: "👾 FPS videogames")
    ig.interests.find_or_create_by(value: "🎵 Prog/Power Metal concerts")
    ig.interests.find_or_create_by(value: "🎲 Listening to funny DnD podcasts")
  end
end
