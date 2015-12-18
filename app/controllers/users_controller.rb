class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    if User.new(user_params).save
      #if you signed in successfully
      flash[:success] = 'You are registered!'
      redirect_to users_path
    else

      flash[:error] = 'Registration failed'
      redirect_to new_user_path

    end
  end

  #private method for user_params.
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


  public
  #Everything below this line is public.
  def edit
  end

  def update
  end

  def destroy
  end
end
