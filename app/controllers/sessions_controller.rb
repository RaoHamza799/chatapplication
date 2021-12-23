class SessionsController < ApplicationController
    before_action :already_logged_in ,only:[:new, :create]
  
    def new
        
    end
    def create

        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:notice] = "Logged in successfully"
          redirect_to root_path
        else
          flash.now[:alert] = "There was something wrong with your login details"
          render 'new'
        end
        
       end
  
    def destroy
        if logged_in?
           session[:user_id] = nil
            flash[:notice] = "Logged out"
            redirect_to login_path
        else
            flash[:notice] = "You have to be Login first"
            redirect_to login_path
        end

    end
      private 
          
       def already_logged_in
          if logged_in?
            flash[:notice] = "You already logged in Here"
            redirect_to root_path
        end
       end
  end 