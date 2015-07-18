module Api
  class CardsController < ApiController
    def ensured_ownership(card)
      unless current_user != card.owner
        return true
      end
      false
    end

    def new
    end

    def create
      card = Card.new(card_params)
      if card.save
        render json: card
      else
        render json: { errors: card.errors.full_messages }, as: 422
      end
    end

    def edit
      card = Card.find(params[:id])
      render json: card
    end

    def update
      card = Card.find(params[:id])
      if ensured_ownership(card) && card.update(card_params)
        render json: card
      else
        render json: { errors: card.errors.full_messages }, as: 422
      end
    end

    def destroy
    end

    def index

    end

    def show
      card = Card.find(params[:id])
      render json: card
    end

    def assess_quality(quality)
      # Make own controller for this

      card = Card.find(params[:id])
      card.assess_response(quality)
    end


    private

    def card_params
      params.require(:card).permit(:deck_id, :question, :answer)
    end

    def quality
      params[:quality]
    end
  end
end
