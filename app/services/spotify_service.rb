class SpotifyService
  attr_reader :spotify_user

  def initialize(user: nil)
    @user = user
  end

  def is_playing?
    @is_playing ||= player&.is_playing || false
  end

  def player
    spotify_user&.player
  end

  def last_played
    currently_playing || recently_played(limit: 1).first
  end

  def currently_playing
    player&.currently_playing
  end

  def recently_played(limit: 20, after: nil, before: nil)
    spotify_user.recently_played(limit: limit, after: after, before: before)
  end

  private

  def spotify_user
    @spotify_user ||= RSpotify::User.new(credentials)
  end

  def credentials
    {
      credentials: {
        token: spotify_authenticable.token,
        refresh_token: spotify_authenticable.refresh_token,
        access_refresh_callback: SpotifyRefreshTokenService.callback(spotify_authenticable)
      },
      id: spotify_authenticable.uid
    }.deep_stringify_keys # rspotify expects string keys
  end

  def spotify_authenticable
    @spotify_authenticable ||= spotify_authenticables.first
  end

  def spotify_authenticables
    @user.authenticables.where(provider: 'spotify')
  end
end
