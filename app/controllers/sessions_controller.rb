
class SessionsController < ApplicationController    
    def create
        @user = User.find_by(email: params[:email].downcase)

         if !!@user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
            session[:current_user_id] = @user.id
            session[:current_user_name] = @user.name
            redirect_to @user
        else

            message = "Something went wrong! Make sure your username and password are correct"
            redirect_to login_path, notice: message
        end
    end
    
    def destroy
        # User.find(session[:user_id]).destroy      
        session[:user_id] = nil
        redirect_to root_path
      end
end