class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      remember user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user_path(current_user)
      flash[:success] = "Welcome back to Vista, #{user.name}!"
    else
      flash[:danger] = 'Invalid login credentials - try again'
      redirect_to root_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  #private method for user_params.
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
