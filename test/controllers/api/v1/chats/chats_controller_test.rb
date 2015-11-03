require 'test_helper'

class API::V1::ChatsControllerTest < ActionController::TestCase
  def setup
    @controller = API::V1::ChatsController.new
  end

  test "#index" do
    user = User.create(name:"ds", email:"fds3@dsa.ru")
    chat1 = user.chats.create
    chat2 = user.chats.create

    get :index, { user_id: user.id }
    assert_not_nill assigns(:chats)
   # get :index, { format: :json }
    #assert_response :success
  end
end
