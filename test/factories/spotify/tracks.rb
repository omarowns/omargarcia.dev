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
FactoryBot.define do
  factory :spotify_track, class: 'Spotify::Track' do
    artist { "MyString" }
    artist_url { "MyString" }
    album { "MyString" }
    album_url { "MyString" }
    song { "MyString" }
    song_url { "MyString" }
    album_cover_url { "MyString" }
    preview_url { "MyString" }
  end
end
