class PasswordResetter

  SUCCESS = "We'll send you an email with instructions for resetting"
  NO_MAIL = "Unable to send email. Please notify webmaster"
  NO_SAVE = "Password reset failed. Please notify webmaster"
  NO_USER = "Unable to log you in. Please check your Email and Password again"

  def initialize(flash)
    @flash = flash
  end

  def handle_reset_request(params)
    if user = User.find_by(email: params[:email])
      reset_code_and_send_email(user)
    else
      @flash.now[:alert] = NO_USER
    end
  end

  def update_password(user, params)
    if user.reset_password(params)
      UserNotifier.password_was_reset(user).deliver
      return true
    end
  end

  private

    def reset_code_and_send_email(user)
      if user.set_password_reset
        send_reset_email(user)
      else
        flash.now[:alert] = NO_SAVE
      end
    end

    def send_reset_email(user)
      begin
        UserNotifier.reset_password(user).deliver
        flash.now[:notice] = SUCCESS
      rescue
        flash.now[:alert] = NO_MAIL
      end
    end
end