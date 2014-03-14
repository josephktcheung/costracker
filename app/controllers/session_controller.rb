class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate params[:user][:email], params[:user][:password]
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome back! #{@user.email}"
      redirect_to @user
    else
      flash[:danger] = "Please sign in again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    render text: "Log the user out"
  end
end