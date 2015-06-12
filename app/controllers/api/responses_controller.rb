module Api
  class ResponsesController < ApplicationController
    def create
      response = Response.new(response_params)
      response.assert_response
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
