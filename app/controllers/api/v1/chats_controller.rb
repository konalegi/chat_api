class API::V1::ChatsController < ApplicationController
  def index
    @chats = current_user.chats
  end

  def create
  end
end
