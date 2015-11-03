class API::V1::ApplicationController < ActionController::Base
  respond_to :json
  class Forbidden < StandardError; end
  protect_from_forgery with: :exception
  before_action :authenticate
  helper_method :current_user

  def current_user
    @current_user ||= User.find(@current_session.user_id)
  end

  def current_user!#should throw exception forbidden
    if @current_session
      @current_user = User.find(@current_session.user_id)
    else
      raise Forbidden, "You are not allowed to access."
    end
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @current_session = Session.find_by token: token
    end
  end
end
