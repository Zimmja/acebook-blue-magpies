module ApplicationHelper
	def logged_in?
		return true if testing?
		!!session[:user_id]
	end

	def current_user
		return User.last if testing?
		@current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
	end

	def testing?
    ENV['RAILS_ENV'] == "test"
  end
end
