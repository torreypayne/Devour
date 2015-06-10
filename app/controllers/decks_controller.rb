class DecksController < ApplicationController
  def new
  end

  def create
    deck = new Deck(deck_params)
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
  end

  def index
    @decks = current_user.decks
  end

  private

  def deck_params
    params.require(:deck).permit(:title, :owner_id, :course_id, :public)
  end
end
