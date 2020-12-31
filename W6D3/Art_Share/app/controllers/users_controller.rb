class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # not so sure about what this is supposed to do 
  # def new
  #   new_user = User.new(name: params[:name], email: params[:email])
  #   render json: new_user
  # end



  def show
    render json: User.find(params[:id])
  end



  def update

    update_user = User.find_by(id: params[:id])

    if update_user
      update_user.update(user_params)
    else
      render json: "not found"
    end
  end



  def destroy
    User.find(params[:id]).delete
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
