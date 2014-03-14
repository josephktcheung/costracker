class UsersController < ApplicationController
  def index
    @users = User.all.entries
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    # render json: params
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to WishGotCha!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
