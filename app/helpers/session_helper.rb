module SessionHelper

  def authenticate_user(params)
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
    else
      flash.now[:alert] = "Unable to log you into the system, please try again"
    end
  end

  def reset_code_and_send_email(user)
    if user.set_password_reset
      send_reset_email(user)
    else
      flash.now[:alert] = "Password reset failed. Please notify webmaster"
    end
  end

  def send_reset_email(user)
    begin
      UserNotifier.reset_password(user).deliver
      flash.now[:notice] = "We'll send you an email with instructions for resetting"
    rescue
      flash.now[:alert] = "Unable to send email. Please notify webmaster"
    end
  end

  def handle_reset_request(params)
    if user = User.find_by(email: params[:email])
      reset_code_and_send_email(user)
    else
      flash.now[:alert] = "Unable to log you in. Please check your email and password and try again."
    end
  end
end