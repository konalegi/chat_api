require 'test_helper'

class API::V1::MessagesControllerTest < ActionController::TestCase
  test "#index" do
    user = FactoryGirl.create(:user)
    message1 = user.messages.create(FactoryGirl.attributes_for(:message))
    message2 = user.messages.create(FactoryGirl.attributes_for(:message))

   # get :index
    #assert_response :success
    #assert_not_nil assigns(:messages)
  end

end
