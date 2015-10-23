class Api::V1::ChatsController < ApplicationController
  before_action :authenticate, only: [:index]
  respond_to :json
  def index(user_id)
    @chats = User.find(uder_id).chats
  end
end
