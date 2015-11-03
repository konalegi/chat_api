class API::V1::Chats::ApplicationController < API::V1::ApplicationController
  def chat
    @chat ||= current_user!.chats.find_by_id(params[:chat_id]) || raise(NotFoundError.new("Chat with id: #{params[:id]} not found"))
    # unless params[:chat_id]
    #   @current_chat = Chat.find_chat_for(current_user.id, params[:receiver].id)
    #   if @current_chat
    #     params[:chat_id] = @current_chat.id
    #   else
    #     @current_chat = Chat.create(users: { id: [current_user.id, params[:receiver].id] })
    #     params[:chat_id] = @current_chat.id
    #   end
    # end
  end
end