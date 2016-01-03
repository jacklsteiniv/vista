class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create

    if User.new(user_params).save
       #redirect to signed in
      flash[:success] = 'Welcome to Vista!'
      redirect_to @user
    else

      flash[:error] = 'Sorry, registration faile'

      redirect_to new_user_path

    end
  end

  def update
  end

private

  def user_params
    params.require(:user).permit(:name, :email,:password,:password_confirmation)
  end

public




end
