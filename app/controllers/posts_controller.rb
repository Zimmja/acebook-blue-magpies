class PostsController < ApplicationController
  before_action :require_login
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # redirect_to posts_url
    redirect_to User.find(@post.loc_id)
  end

  def index
  @posts = Post.all
  #   SELECT users.name, users.id, posts.message
  #   FROM users, posts
  #   WHERE posts.user_id = users.id
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  
  end


  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
    redirect_to User.find(@post.loc_id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if session[:user_id] == @post.user_id
      @post.destroy
      redirect_to current_user
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:message, :user_id, :loc_id, images: [])
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
  
end
