class LastPlayedJob < ApplicationJob
  queue_as :low

  def perform(*args)
    user = User.joins(:authenticables).find_by(authenticables: { provider: 'spotify' })
    service = SpotifyService.new(user: user)
    last_played_track = service.last_played

    track = Spotify::Track.from(last_played_track)

    track.save
  end
end
