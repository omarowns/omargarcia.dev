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
class Spotify::Track < ApplicationRecord

  def self.from(rspotify_track)
    new(
      artist: rspotify_track.album.artists.first.name,
      artist_url: rspotify_track.album.artists.first.external_urls['spotify'],
      album: rspotify_track.album.name,
      album_url: rspotify_track.album.external_urls['spotify'],
      song: rspotify_track.name,
      song_url: rspotify_track.external_urls['spotify'],
      album_cover_url: rspotify_track.album.images.find { |img| img['height'] == 300 }['url'],
      preview_url: rspotify_track.preview_url
    )
  end
end
