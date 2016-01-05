class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # # user = User.find_by(email: params[:session][:email].downcase)
    # user = User.where( email: user_params[:email]).first

    # if user && user.authenticate(params[:password])
    #   log_in user
    #   params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    #   redirect_back_or user
    #   flash[:success] = 'You are signed in!'
    # else
    #   flash[:danger] = 'Invalid email/password combination'
    #   redirect_to new_session_path
    # end

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(current_user)
      flash[:success] = "Welcome back to Vista, #{user.name}!"
    else
      flash[:danger] = 'Invalid login credentials - try again!'
      render :new
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
