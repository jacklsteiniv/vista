class PostsController < ApplicationController

  #Only a logged-in user can create or destroy a post.
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    flash[:success] = 'You deleted your post.'
    redirect_to root_path
  end

end
