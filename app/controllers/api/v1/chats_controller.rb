class API::V1::ChatsController < API::V1::ApplicationController
  def index
    render json: current_user!.chats
  end

  def create
  end

  def destroy
  end
end