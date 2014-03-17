class SessionController < ApplicationController
  def new
    redirect_to root_url, notice: "You are logged in." if current_user
  end

  def create
    # user = User.authenticate params[:user][:email], params[:user][:password]
    user = User.find_by(email: params[:user][:email])
    password = params[:user][:password]
    if password.blank?
      user.set_password_reset if user
      flash.now[:notice] = "We will send you a reset password email"
      render :new
    elsif user and user.authenticate(password)
      session[:user_id] = user.id
      flash[:success] = "Welcome back! #{user.email}"
      sign_in user
      redirect_to user
    else
      flash.now[:danger] = "Please sign in again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, flash: {success: "Successfully log out! See you next time!"}
  end
end