class UserController < ApplicationController
  def register
    @user= User.new(user_params)
    if @user.save   
      session[:user_id] = @user.id
      redirect_to club_directory_path
    else
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
