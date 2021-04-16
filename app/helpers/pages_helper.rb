module PagesHelper
  def current_age_text
    "#{current_age} y/o"
  end

  def current_age
    TimeDifference.between(dob, Date.today).in_years.to_i
  end

  def dob
    Date.new(1991, 12, 20)
  end

  def profiles_include_hash
    {
      image_proxies: {
        image: {
          file_attachment: :blob
        }
      },
      about: {},
      work_group: {},
      interest_group: {},
      location_group: {},
      active_about_lines: {},
      active_works: {},
      active_interests: {},
      active_location_proxies: {},
    }
  end
end
