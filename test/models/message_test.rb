require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "should not save message without text" do
    @message = Message.new(chat_id: 1, user_id: 2)
    assert_not @message.save
  end

  test "should not save message without user_id" do
    @message = Message.new(text:"sometext", chat_id: 1)
    assert_not @message.save
  end

  test "should not save message without chat_id" do
    @message = Message.new(text: "sometext", user_id: 1)
    assert_not @message.save
  end

  test "should not save message with non-integer user_id" do
    @message = Message.new(text: "sometext", chat_id: 1, user_id: -3)
    assert_not @message.save
  end

  test "should not save message with non-integer chat_id" do
    @message = Message.new(text: "sometext", user_id: 3, chat_id: -2)
    assert_not @message.save
  end

  test "should save message if everything is OK" do
    @message = Message.new(text: "sometext", user_id: 3, chat_id: 1)
    assert @message.save
  end
end
