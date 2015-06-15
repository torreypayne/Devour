class Api::LeaderboardsController < ApplicationController
  def show
  end

  def index
    @users = User.all
    # Go ahead with Marcel's idea to make the count based off score = current_user.cards.length - current_user.reviewCards.length
    render :index
  end
end
