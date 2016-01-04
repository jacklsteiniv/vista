class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # user = User.where( email: user_params[:email]).first

    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(user_params[:password])
      log_in user
      redirect_to user

      flash[:success] = 'You are signed in!'
      # redirect_to users_path
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to new_session_path
    end
  end

  def destroy
    log_out
    redirect_to new_session_path
  end

  #private method for user_params.
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
