class API::V1::Chats::MessagesController < ApplicationController

  def index
    @messages = chat.messages.recent.paginate(page: params[:page])
    @unread_messages_number = messages.unread.count if params[:read].present?
  end

  def create
    @message = chat.messages.build(message_params)
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.error, status: :unprocessable_entity
    end
  end

  private
    def message_params
      params.require(:message).permit(:text)
    end
end
