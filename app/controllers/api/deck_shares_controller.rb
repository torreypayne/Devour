class Api::DeckSharesController < ApplicationController
  def create
    @deckshare = DeckShare.new(search_params)
    if @deckshare.save
      render json: {}
    else
      render json: @deckshare.errors.full_messages
    end
  end

  def destroy
    deckshare = DeckShare.find(params[:id])
    deckshare.destroy!
  end

  private

  def search_params
    params.require(:deck_share).permit(:deck_id, :user_id)
  end
end
