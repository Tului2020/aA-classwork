class ArtworksController < ApplicationController
  def index
    render json: Artwork.joins(:artist).where(users: {id: params[:user_id]})
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  # not so sure about what this is supposed to do 
  # def new
  #   new_user = User.new(name: params[:name], email: params[:email])
  #   render json: new_user
  # end



  def show
    render json: Artwork.find(params[:id])
  end



  def update

    update_artwork = Artwork.find_by(id: params[:id])

    if update_artwork
      update_artwork.update(artwork_params)
    else
      render json: "not found"
    end
  end



  def destroy
    Artwork.find(params[:id]).delete
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end
end
