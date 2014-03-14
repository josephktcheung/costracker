class SessionController < ApplicationController
  def new
  end

  def create
    user = User.authenticate params[:user][:email], params[:user][:password]
    if user
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