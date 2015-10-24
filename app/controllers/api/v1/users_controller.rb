class UsersController < ApplicationController
  def current_user
    User.find(TOKEN[:token])
  end
end
