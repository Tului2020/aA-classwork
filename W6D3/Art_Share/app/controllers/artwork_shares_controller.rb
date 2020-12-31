class ArtworkSharesController < ApplicationController


  def index
    render json: ArtworkShare.all
  end

  def create
    artwork_shares = ArtworkShare.new(artwork_shares_params)
    if artwork_shares.save
      render json: artwork_shares
    else
      render json: artwork_shares.errors.full_messages, status: :unprocessable_entity
    end
  end



  def destroy
    ArtworkShare.find(params[:id]).delete
  end

  private
  def artwork_shares_params
    params.require(:artwork_shares).permit(:viewer_id, :artwork_id)
  end
end
