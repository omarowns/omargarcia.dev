class AddUriToSpotifyTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :spotify_tracks, :uri, :string, unique: true
  end
end
