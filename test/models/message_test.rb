require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "should not save message without text" do
    message = Message.new
    assert_not message.save
  end
  test "should not save message without user_id" do
    message = Message.new
    assert_not message.save
  end
  test "should not save with non-integer user_id" do
    message = Message.new(text: "sometext", user_id: -3)
    assert_not message.save
  end
end
