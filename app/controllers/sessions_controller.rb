class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:username])     
      session[:user_id] = user.id
      redirect_to club_directory_path
    else
      flash[:notice] = "Invalid user name"
      redirect_to root_path
    end
  end  
end

