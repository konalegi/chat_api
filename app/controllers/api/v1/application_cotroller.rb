class API::V1::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate
  helper_method :current_user

  TOKEN = {
    "first": 1,
    "second": 2,
    "third": 3
  }
protected
  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def current_user!#should throw exception forbidden
  end

  def authenticate
    authenticate_or_request_with_http_token do |token|
      TOKEN.has_key?(token)
    end
  end
end