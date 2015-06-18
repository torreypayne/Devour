class Api::MessagesController < ApplicationController
  def create
  end

  def show
  end

  def index
    @messages = {
      received: current_user.received_messages,
      sent: current_user.sent_messages
    }
    render json: { messages: @messages }
  end
end
