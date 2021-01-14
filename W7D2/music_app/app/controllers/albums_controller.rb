class AlbumsController < ApplicationController

  def new
    render :new
  end 

  def create
      @album = Album.new(album_params)

      if @album.save
        redirect_to album_url(@album)
      else
        flash.now[:errors] = @album.errors.full_messages
        render :new
      end
  end 
  
  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end 
    
  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def update
    album = Album.find_by(id: params[:id])
    
    if album.update(album_params)
        redirect_to album_url(album)
    else
        render json: "Invalid Album ID"
    end
  end

  def destroy
      album = Album.find_by(id: params[:id])

      if album
        redirect_to band_url(album.delete.band_id)
      else
        render json: "Invalid Album ID"
      end
  end

  
  private
  def album_params
    params.require(:album).permit(:band_id, :title, :year, :record_type)
  end
end
