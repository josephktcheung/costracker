class UserAuthenticator

  def initialize(session, flash)
    @flash = flash
    @session = session
  end

  def authenticate_user(params)
    @flash.now[:alert] = AUTH_FAILED unless @user = User.authenticate(params[:email], params[:password])
    @user
  end
end
