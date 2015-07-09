class Api::LeaderboardsController < ApplicationController
  def show
  end

  def index
    users = User.all
    users.each do |user|
      user.score = user.owned_decks.length*500 + user.responses.length*300 + 5000
    end
    @users = users.sort { |x,y| x.score <=> y.score }.reverse
    render :index
  end
end
