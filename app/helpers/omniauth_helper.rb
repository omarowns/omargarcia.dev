module OmniauthHelper
  def find_or_set_user_from_auth(auth)
    if (authenticable = Authenticable.find_by(provider: auth.provider, uid: auth.uid))
      authenticable.user
    elsif (user = User.find_for_database_authentication(email: auth.info.email))
      user.authenticables.create(auth_hash(auth))

      user
    elsif current_user.present?
      current_user.authenticables.create(auth_hash(auth))
      current_user
    else
      User.new
    end
  end

  def auth_hash(auth)
    auth_hash = { provider: auth.provider, uid: auth.uid }

    auth_hash[:token] = auth.credentials.token if auth.credentials.token
    auth_hash[:token_secret] = auth.credentials.secret if auth.credentials.secret
    auth_hash[:refresh_token] = auth.credentials.refresh_token if auth.credentials.refresh_token

    auth_hash
  end
end
