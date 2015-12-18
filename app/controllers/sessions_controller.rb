class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.where( email: user_params[:email]).first

    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id

      flash[:success] = 'You are signed in!'
      redirect_to users_path
    else
      flash[:error] = 'Unable to log you in'

      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:error] = 'You have been logged out'
    redirect_to users_path
  end

  #private method for user_params.
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
