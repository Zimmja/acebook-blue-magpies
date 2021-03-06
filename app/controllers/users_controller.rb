class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  # before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  def index
  end

  def new
    @user = User.new
  end

  def show
    @profile = User.find(params[:id])
    @posts = Post.all
    @users = User.all
  end

  def create
    @user = User.new(downcase_email(user_params))

    if @user.save
      session[:user_id] = @user.id
      session[:current_user_id] = @user.id
      session[:current_user_name] = @user.name
      # login_url @user
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image) 
  end

  def downcase_email(params)
    params[:email] = params[:email].downcase
    return params
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end

  # private

  # def set_s3_direct_post
  #   @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  # end

end
