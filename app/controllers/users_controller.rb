class UsersController < ApplicationController
  # before_action :is_authenticated?, only: [:show]
  def index
    @users = User.all.entries
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # render json: params
    @user = User.new(user_params)
    if @user.save
      sign_in(@user, "Welcome to WishGotCha!")
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
