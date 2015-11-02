class API::V1::ApplicationController < ActionController::Base
  class Forbidden < StandardError; end
  protect_from_forgery with: :exception
  before_action :authenticate
  helper_method :current_user

  TOKENS = ActiveSupport::HashWithIndifferentAccess.new
  TOKENS[:first] = 1
  TOKENS[:second] = 2
  TOKENS[:third] = 3

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def current_user!#should throw exception forbidden
    if session[:user_id]
      @current_user ||= User.find session[:user_id]
    else
      raise Forbidden, "You are not allowed to access."
    end

  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      TOKENS.has_key?(token)
      session[:user_id] = TOKENS[token]
    end
  end
end
