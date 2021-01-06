class BandsController < ApplicationController
    def index 
      @bands = Band.all
      render :index
    end

    def create
      @band = Band.new(band_params)

      if @band.save
        redirect_to band_url(@band)
      else
        flash.now[:errors] = @band.errors.full_messages
        render :new
      end
    end
    
       
    def new
      render :new
    end 

    def edit
      @band = Band.find_by(id: params[:id])
      if @band
        render :edit
      else
        render json: "Invalid Band ID"
      end
    end
    
    
    def show
      @band = Band.find_by(id: params[:id])
      render :show
    end

      
    def update
      band = Band.find_by(id: params[:id])
      
      if band.update(band_params)
        redirect_to band_url(band)
      else
        # flash.now[:errors] = ["Invalid Band ID"]#@band.errors.full_messages
        # render :edit
        render json: "Invalid Band ID"
      end
    end
    
    def destroy
      band = Band.find_by(id: params[:id])

      if band.delete
        # redirect_to request.referrer
        redirect_to bands_url
      else
        render json: "Invalid Band ID"
      end
      
    end

    private

    def band_params
      params.require(:band).permit(:name)
    end
      
end
