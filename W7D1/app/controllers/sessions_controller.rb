class SessionsController < ApplicationController


  def new
    render :new
  end

  def create
    check = User.find_by_credentials(user_params[:username], user_params[:password])
    if check
      user = User.find_by(username: user_params[:username])
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      flash.now[:errors] =  "User not found"
      render :new

    end

  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
