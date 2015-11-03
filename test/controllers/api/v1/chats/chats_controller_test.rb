require 'test_helper'

class API::V1::ChatsControllerTest < ActionController::TestCase

  test "#index" do
    debugger
    user = User.create name:"ramil", email:"ramil@sitdikov.me", id: 1
    chat1 = user.chats.create
    chat2 = user.chats.create
    Session.create(user_id: 1, token: "first")

    get :index, { format: :json }, { "HTTP_AUTHORIZATION" => "Token token=1111" }
    assert_response :success
  end
end
