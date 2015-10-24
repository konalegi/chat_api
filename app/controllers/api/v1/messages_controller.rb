class API::V1::MessagesController < ApplicationController
  def index
    @messages = current_user.messages
  end

  def create
    @message = current_user.messages.new(params[:message])
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.error, status: :unprocessable_entity
    end
  end
end
