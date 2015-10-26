class API::V1::MessagesController < ApplicationController

  def index
    @messages = current_user.messages
    @recent_messages = @messages.recent.paginate(page: params[:page])
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
      unless params[:chat_id]
        @current_chat = Chat.find_chat_for(current_user.id, params[:receiver].id)
        if @current_chat
          params[:chat_id] = @current_chat.id
        else
          @current_chat = Chat.create(users: { id: [current_user.id, params[:receiver].id] })
          params[:chat_id] = @current_chat.id
        end
      end
    end

    def message_params
      params.require(:message).permit(:text, :user_id, :chat_id)
    end
end
