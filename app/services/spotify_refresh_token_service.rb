class SpotifyRefreshTokenService
  def self.callback(authenticable)
    Proc.new do |new_access_token, token_lifetime|
      now = Time.now.utc.to_i
      deadline = now + token_lifetime
      authenticable.update(token: new_access_token)
    end
  end
end
