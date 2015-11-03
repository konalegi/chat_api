require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    @user = User.new(email: "ramil@sitdikov.me")
    assert_not @user.save
  end
  test "should not save user without email" do
    @user = User.new(name: "ramil")
    assert_not @user.save
  end

  test "shpuld save user if everything is OK" do
    @user = User.new(email: "ramil@sitdikov.me", name: "ramil")
    assert @user.save
  end
end
