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
end
