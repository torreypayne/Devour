module Api
  class DecksController < ApiController

    def ensure_ownership(deck)
      unless current_user != deck.owner
        return true
      end
      false
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
      @decks = current_user.decks.includes(:cards) if current_user
      @decks.page(params[:page])
      render :index
    end

    def show
      @deck = Deck.includes({cards: :responses}).find(params[:id])
      @review_cards = @deck.review_cards(current_user.id).shift(10)
      render :show
    end

    def details
      one_day = 60 * 60 * 24*1000
      @deck = Deck.includes({ cards: :responses }).find(params[:id])
      @deck.cards.map do |card|
        most_recent_data = card.latest_response(current_user.id)
        card.curr_e_factor = most_recent_data.e_factor
        card.curr_repetitions = most_recent_data.repetitions
        card.passed_at = most_recent_data.last_passed
        card.next_interval = most_recent_data.next_rep
        if ((Time.now.to_f*1000 - card.passed_at).div(one_day) > card.next_interval)
          card.days_out = 0
        else
          card.days_out = -((Time.now.to_f*1000 - card.passed_at)/one_day - card.next_interval)
        end
      end
      render :details
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
