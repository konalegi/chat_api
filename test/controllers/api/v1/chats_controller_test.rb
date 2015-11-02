require 'test_helper'

class API::V1::ChatsControllerTest < ActionController::TestCase
  test "index" do
    user = User.create
    authenticate

    get :index, { format: :json }
    assert_response :success
  end
end
