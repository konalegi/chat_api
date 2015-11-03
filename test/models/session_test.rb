require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test "should not save session without user_id" do
    @session = Session.new(token: "sometoken")
    assert_not @session.save
  end

  test "should not save session without token" do
    @session = Session.new(user_id: 1)
    assert_not @session.save
  end

  test "should not save session with non-integer user_id" do
    @session = Session.new(token: "sometoken", user_id: -3)
    assert_not @session.save
  end

  test "should save session if everything is OK" do
    @session = Session.new(token: "sometoken", user_id: 3)
    assert @session.save
  end
end
