require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  test "#find_chat_for if chat exists" do
    @sender = FactoryGirl.create(:user, name: "SenderName")
    @recipient = FactoryGirl.create(:user, name: "RecipientName")
    @chat = Chat.create
    @chat.users << [@sender, @recipient]
    @found_chat = @chat.find_chat_for(@sender, @recipient)
    assert_equal @chat, @found_chat
  end
end
