module Api
  class ResponsesController < ApplicationController
    def create
      card = Card.includes(:responses).find(response_params[:card_id])
      response = card.latest_response(current_user.id)
      response.quality = response_params[:quality]
      response.assert_response(current_user.id)
      if response.save
        render json: {}
      else
        render json: response.errors, as: :unproccessable_entity
      end
    end

    private

    def response_params
      params.require(:response).permit(:card_id, :quality, :e_factor)
    end
  end
end
