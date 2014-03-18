module SessionHelper

  def authenticate_user(params)
    if User.authenticate(params[:email], params[:password])
      redirect_to root_url
    else
      flash.now[:alert] = "Unable to log you in. Please check your email and password and try again."
    end
  end

  def handle_reset_request(params)
    puts "handle reset request", user_params
  end
end


# def create
#   user = User.find_by(email: params[:user][:email])
#   password = params[:user][:password]

#   if user
#     # password reset
#     if password.blank?
#       if user.set_password_reset
#         UserNotifier.reset_password(user).deliver
#         flash.now[:notice] = "We'll send you an email with instrutions for resetting"
#       else
#         flash.now[:alert] = "Password reset failed."
#       end
#       render :new
#     elsif user.authenticate(password)
#       #user authentication
#       session[:user_id] = user.id
#       render text: "fail"
#     else
#       # user mistypes password
#     end

#   else
#     # no such user
#     flash.now[:alert] = "Unable to log you in. Please check your email and password and try again."
#     render :new
#   end

# end