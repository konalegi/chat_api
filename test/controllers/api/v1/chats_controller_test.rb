require 'test_helper'

class API::V1::ChatsControllerTest < ActionController::TestCase
  test "index" do
    user = User.create(create_user
    authenticate(user)

    get :index, { format: :json }
    assert_response :success
  end
end
