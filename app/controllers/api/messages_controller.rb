class Api::MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.sender_id = current_user.id
    if message.save
      render json: {}
    end
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

  private

  def message_params
    params.require(:message).permit(:receiver_id, :body)
  end
end
