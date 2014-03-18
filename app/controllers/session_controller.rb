class SessionController < ApplicationController
  include SessionHelper

  def new
    redirect_to root_url, notice: "You are logged in." if current_user
  end

  def create
    if params[:user][:password].blank?
      handle_reset_request(user_params)
    else
      authenticate_user(user_params)
    end
    render :new
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, flash: {success: "Successfully log out! See you next time!"}
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end