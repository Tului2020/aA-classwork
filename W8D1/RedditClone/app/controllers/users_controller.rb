class UsersController < ApplicationController

  before_action :require_logged_in, only: [:show, :index, :destroy, :update]


  def new
    @user = User.new 
    render :new
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors]=@user.errors.full_messages
      render :new 
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user && @user == current_user
      @user.destroy
    else
      flash[:errors] = ['You may only delete yourself']
      redirect_back(fallback_location: fallback_location) 
    end


  end

  def index 
    @users = User.all
    render :index
  end

  # def update 
  #   @user = User.find_by(id: params[:id])
  #   if @user 
  #       if @user = current_user
  #           @user.update_attributes(user_params)
  #           flash[:errors] = @user.errors.full_messages 
  #       else
  #           flash[:errors] = ["Must be logged in as #{@user.username}"]
  #       end
  #       render :show
  #   else
  #       flash[:errors] = ['user does not exist']
  #       render :index
  #   end   
  # end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end


  def edit 
    @user = User.find_by(id: params[:id])
    render :edit
  end

  private

  def user_params 
      params.require(:user).permit(:username, :password)
  end

    
end
