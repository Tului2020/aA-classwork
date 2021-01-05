class SessionsController < ApplicationController


  def new
    render :new
  end

  def create
    if User.find_by_credentials(user_params[:username], user_params[:password])
      user = User.find_by(username: username)
    else
      
    end
    session[:session_token] = user.reset_session_token!
    redirect_to cats_url
  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
