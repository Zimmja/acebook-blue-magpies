class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all
    @users = User.all
    #@user = User.find(session[:user_id])
  end

  def create
    @user = User.new(downcase_email(user_params))

    if @user.save
      session[:user_id] = @user.id
      login_url @user
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password) 
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

end
