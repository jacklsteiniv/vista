class PostsController < ApplicationController
  #Essentially, posts are the 'gated' content on Vista.
  #A visitor can see hikes to get 'hooked', and then must log in or register
  #to edit the reviews. Reviews = the money-maker.

  before_action :authorize
  #Only a logged-in user can create or destroy a post. Add in.
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]

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
    @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path
        flash[:success] = "You added review ##{@post.id}!"
      else
        render :new
        flash[:danger] = 'Sorry, we could not add your review.'
      end
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    flash[:success] = 'You deleted your review.'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:hike_id, :user_id, :img_url, :content)
  end

end
