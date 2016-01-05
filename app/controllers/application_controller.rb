class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  include SessionsHelper

  helper_method :current_user

protected
# Not sure if above line is necessary?
  def current_user
    # @current_user = User.find 207
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def authorize
    unless current_user
      flash[:error] = "Log in to view this page"
      redirect_to new_session_path
    end
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
