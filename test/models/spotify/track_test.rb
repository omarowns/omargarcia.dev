# == Schema Information
#
# Table name: spotify_tracks
#
#  id              :bigint           not null, primary key
#  album           :string
#  album_cover_url :string
#  album_url       :string
#  artist          :string
#  artist_url      :string
#  preview_url     :string
#  song            :string
#  song_url        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class Spotify::TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
