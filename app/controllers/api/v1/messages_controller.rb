class API::V1::MessagesController < ApplicationController

  def index
    @messages = current_user.messages
    @recent_messages = @messages.recent.paginate(page: params[:page])
    @unread_messages_number = messages.unread.count if params[:read].present?
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.error, status: :unprocessable_entity
    end
  end

  private

    def message_params
      params.require(:message).permit(:text, :user_id, :chat_id)
    end
end
