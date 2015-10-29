class API::V1::Chats::ChatsController < ApplicationController
  def chat
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

  def index
    #@chats = current_user.chats
  end

  def create
  end
end
