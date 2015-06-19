module Api
  class DecksController < ApiController


    def ensure_ownership(deck)
      unless current_user == deck.owner
        return true
      end
      return false
    end

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
      if ensure_ownership(@deck)
        @deck.destroy!
        render json: {}
      else
        render json: ["The Current User does not own the selected deck."], as: :unauthorized
      end
    end

    def index
      # if params[:title]
      #   @decks = current_user.decks.where('LOWER(title) ~ ?', params[:title].downcase) if current_user
      # else
      @decks = current_user.decks.includes(:cards) if current_user
      @decks.page(params[:page])
      # end
      render :index
    end

    def show
      # Write 'allCards' param so I can decide if I want review cards
      #  or all cards
      @deck = Deck.includes({cards: :responses}).find(params[:id])
      @review_cards = @deck.review_cards(current_user.id).shift(10)
      render :show
    end

    def review
      @deck = Deck.includes(:cards).find(params[:id])
      render :quiz
    end

    def public_decks
      if params[:title]
        @decks = Deck.where(public: true).where('LOWER(title) ~ ?', params[:title].downcase)
      else
        @decks = Deck.where(public: true)
      end
      render :index
    end

    private

    def deck_params
      params.require(:deck).permit(:title, :owner_id, :course_id, :public, :page)
    end
  end
end
