class API::V1::ChatsController < ApplicationController
  def index
    @chats = current_user.chats
  end
end
