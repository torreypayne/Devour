module Api
  class ResponsesController < ApplicationController
    def create
      card = Card.find(response_params[:card_id])
      response = card.latest_response(current_user.id)
      response.assert_response(current_user.id)
      if response.save
        render json: {}
      else
        render json: response.errors, as: 422
      end
    end

    private

    def response_params
      params.require(:response).permit(:card_id, :quality, :e_factor)
    end
  end
end
