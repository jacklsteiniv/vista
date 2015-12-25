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
       #redirect to signed in
      flash[:success] = 'you are registered'
      redirect_to users_path
    else

      flash[:error] = 'registration has failed'

      redirect_to new_user_path

    end
  end

private

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end

public

  def edit
  end

  def update
  end

  def destroy
  end
end
