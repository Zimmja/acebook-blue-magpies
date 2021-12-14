class UsersController < ApplicationController
  #skip_before_action :require_login, only: [:new, :create]
  def index
  end

  def new
    shout "sign-up page (users: new) loaded"
    @user = User.new
  end

  def show
    shout "show page loaded"
    @user = User.find(params[:id])
    @posts = Post.all
    @users = User.all
    #@user = User.find(session[:user_id])
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      shout "saved new user"
      session[:user_id] = @user.id
      login_url @user
      redirect_to @user
    else
      shout "failed to save new user"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password) 
  end

  def shout(message)
    # puts "\n#{"="*35}\nPAY ATTENTION TO ME!\n#{message}\n#{"="*35}\n\n"
  end

end
