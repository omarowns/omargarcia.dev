class UserFromOmniauth
  attr_accessor :auth

  def initialize(auth)
    @auth = auth
  end

  def find_or_set
    if (authenticable = Authenticable.find_by(provider: auth.provider, uid: auth.uid))
      authenticable.user
    elsif (user = User.find_for_database_authentication(email: auth.info.email))
      auth_hash = { provider: auth.provider, uid: auth.uid }

      auth_hash[:token] = auth.credentials.token if auth.credentials.token
      auth_hash[:token_secret] = auth.credentials.secret if auth.credentials.secret
      auth_hash[:refresh_token] = auth.credentials.refresh_token if auth.credentials.refresh_token

      user.authenticables.create(auth_hash)

      user
    else
      User.new
    end
  end
end
