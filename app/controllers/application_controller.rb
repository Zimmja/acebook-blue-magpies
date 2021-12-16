class ApplicationController < ActionController::Base
#   before_action :require_login
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  
  def current_user
    if !session[:user_id].nil? && User.count < session[:user_id]
      session[:user_id] = nil
    end
    @_current_user ||= User.find(session[:user_id]) if !!session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end 
end
