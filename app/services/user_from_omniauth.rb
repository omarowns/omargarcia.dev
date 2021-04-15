class UserFromOmniauth
  attr_accessor :auth

  def initialize(auth)
    @auth = auth
  end

  def find_or_set
    if (authenticable = Authenticable.find_by(provider: auth.provider, uid: auth.uid))
      authenticable.user
    elsif (user = User.find_for_database_authentication(email: auth.info.email))
      user.authenticables.create(provider: auth.provider, uid: auth.uid)
      user
    else
      User.new
    end
  end
end
