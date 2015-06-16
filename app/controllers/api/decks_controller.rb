module Api
  class DecksController < ApiController
    def new
    end

    def create
      deck = Deck.new(deck_params)
      if deck.save
        render json: deck
      else
        render json: deck.errors, as: :unprocessable_entity
      end
    end

    def edit
      @deck = Deck.find(params[:id])
      render json: @deck
    end

    def update
    end

    def destroy
      @deck = Deck.find(params[:id])
      @deck.destroy!
      render json: {}
    end

    def index
      @decks = current_user.decks if current_user
      render :index
    end

    def show
      # Write 'allCards' param so I can decide if I want review cards
      #  or all cards
      @deck = Deck.find(params[:id])
      @review_cards = @deck.review_cards(current_user.id).shift(10)
      render :show
    end

    def review
      @deck = Deck.includes(:cards).find(params[:id])
      render :quiz
    end

    def public_decks
      @decks = Deck.all.select { |card| card.public }
      render :index
    end

    private

    def deck_params
      params.require(:deck).permit(:title, :owner_id, :course_id, :public)
    end
  end
end
