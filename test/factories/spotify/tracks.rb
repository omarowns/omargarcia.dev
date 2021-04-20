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
