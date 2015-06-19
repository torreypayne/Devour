class Api::LeaderboardsController < ApplicationController
  def show
  end

  def index
    users = User.all
    users.each do |user|
      user.score = user.owned_decks.length*500 + user.responses.length*300 + 5000
    end
    @users = users.sort { |x,y| x.score <=> y.score }.reverse
    # Go ahead with Marcel's idea to make the count based off score = current_user.cards.length - current_user.reviewCards.length
    render :index
  end
end
