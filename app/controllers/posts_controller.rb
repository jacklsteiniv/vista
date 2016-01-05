class PostsController < ApplicationController

  #Only a logged-in user can create or destroy a post. Add in.
  before_action :logged_in_user, only: [:destroy]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def create
    @post = @user.post.build(post_params)
      if @post.save
        redirect_to posts_path
        flash[:success] = 'You added @post.name!'
      else
        render :new
        flash[:error] = 'Sorry, we could not add your post.'
      end
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    flash[:success] = 'You deleted your post.'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:img_url, :user_id,:user_id, :content, :hike_id)
  end

end
