class ApplicationController < ActionController::Base
  before_action :authenticate
  protect_from_forgery with: :exception
  TOKEN = {
    "first": 1,
    "second": 2,
    "third": 3
  }

  private
    def authenticate
      authenticate_or_request_with_http_token do |token|
        TOKEN.has_key?(token)
      end
    end
end
