class API::V1::ChatsController < API::V1::ApplicationController
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
    render text: User.find(session[:user_id]).chats.to_json
  end

  def create
  end

  def destroy
  end
end
