class API::V1::Chats::MessagesController < ApplicationController

  def index
    @messages = chat.messages.recent.paginate(page: params[:page])
    @unread_messages_number = messages.unread.count if params[:read].present?
  end

  def create
    set_chat
    @message = current_user.messages.build(message_params)
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.error, status: :unprocessable_entity
    end
  end

  private

    def set_chat

    end

    def message_params
      params.require(:message).permit(:text, :user_id, :chat_id)
    end
end
