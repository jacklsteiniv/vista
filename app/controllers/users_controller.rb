class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  before_action :correct_user,   only: [:edit, :update]

  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #redirect to signed in
      log_in @user
      flash[:success] = "Welcome to Vista, #{@user.name}!"
      redirect_to @user
    else
      flash[:danger] = 'Sorry, registration failed'
      redirect_to root_path

    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      @user.destroy
      flash[:success] = "#{@user.name} has been deleted."
      redirect_to users_url
    else
      flash[:danger] = "No authority to delete."
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email,:password,:password_confirmation)
  end

   #Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to root_path
    end
  end


    # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end

end
