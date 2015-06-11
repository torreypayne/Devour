module Api
  class ResponsesController < ApplicationController
    def create
      response = Response.new(response_params)
      if response.save
        response.assert_response
        render json: {}
      else
        render json: response.errors, as: 422
      end
    end

    private

    def response_params
      params.require(:response).permit(:card_id, :quality, :current_e_factor)
    end
  end
end
