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
    @user = User.new(user_params)
    if @user.save
      #redirect to signed in
      log_in @user
      flash[:success] = 'Welcome to Vista!'
      redirect_to user_url(@user)
    else
      flash[:error] = 'Sorry, registration failed'
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
