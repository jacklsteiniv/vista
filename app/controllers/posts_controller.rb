class PostsController < ApplicationController
  def index
    @post = Post.all
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
