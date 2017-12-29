class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # same as redirect_to user_url(@user)
      # redirect flash at once
      flash[:success] = "Welcome to the sample app!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      # strong parameter
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
