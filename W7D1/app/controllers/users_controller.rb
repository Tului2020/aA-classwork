class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    # debugger
    # render json: @user
    if @user.save
      redirect_to cats_url
    else
      render json: "Could not create user"
      # render :new
    end

  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
