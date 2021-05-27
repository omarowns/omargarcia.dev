# == Schema Information
#
# Table name: visits
#
#  id            :bigint           not null, primary key
#  address       :string
#  city          :string
#  country       :string
#  ip            :string
#  latitude      :string
#  longitude     :string
#  postal_code   :string
#  state         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  impression_id :bigint           not null
#
# Indexes
#
#  index_visits_on_impression_id  (impression_id)
#
# Foreign Keys
#
#  fk_rails_...  (impression_id => impressions.id)
#
class Visit < ApplicationRecord
  belongs_to :impression

  geocoded_by :ip

  after_create :geocode!
  after_create :search!

  private

  def geocode!
    geocode
    save
  end

  def search!
    results = Geocoder.search(geocode)
    %i(country state city postal_code address).each do |attribute|
      send("#{attribute}=".to_sym, results&.first&.send(attribute))
    end
    save
  end
end
